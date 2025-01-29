use diesel::prelude::*;

use crate::db::establish_connection;
use crate::db::models::{NewIngredient, NewInstruction, NewRecipeWithDetails, Recipe};
use crate::db::schema::ingredients::dsl::*;
use crate::db::schema::instructions::dsl::*;
use crate::db::schema::recipes::dsl::*;
use crate::shared::LastInsertRowId;
use axum::{debug_handler, extract::Json, response::IntoResponse};
use diesel::result::Error;
use diesel::sql_query;

#[debug_handler]
pub async fn create_recipe(Json(new_recipe): Json<NewRecipeWithDetails>) -> impl IntoResponse {
    let mut conn: SqliteConnection = establish_connection();

    println!("Creating recipe from a request");

    let transaction_result: Result<(), Error> = conn.transaction::<_, Error, _>(|txn| {
        let NewRecipeWithDetails {
            recipe,
            ingredients: ingredient_list,
            instructions: instruction_list,
        } = new_recipe;

        diesel::insert_into(recipes)
            .values(&recipe)
            .execute(txn)
            .expect("Failed to create recipe");

        let last_row: LastInsertRowId =
            sql_query("SELECT last_insert_rowid() AS last_insert_rowid")
                .get_result(txn)
                .expect("Can't get uploaded recipe id");

        let new_ingredients: Vec<NewIngredient> = ingredient_list
            .into_iter()
            .map(|instr_name| NewIngredient {
                recipe_id: last_row.last_insert_rowid,
                name: instr_name,
            })
            .collect();

        if !new_ingredients.is_empty() {
            diesel::insert_into(ingredients)
                .values(&new_ingredients)
                .execute(txn)
                .expect("Failed to insert ingredients");
        }

        let new_instructions: Vec<NewInstruction> = instruction_list
            .into_iter()
            .enumerate()
            .map(|(index, instr_description)| NewInstruction {
                recipe_id: last_row.last_insert_rowid,
                step_number: (index + 1) as i32,
                description: instr_description,
            })
            .collect();

        if !new_instructions.is_empty() {
            diesel::insert_into(instructions)
                .values(&new_instructions)
                .execute(txn)
                .expect("Failed to insert instructions");
        }

        Ok(())
    });

    match transaction_result {
        Ok(_) => Json("Recipe created successfully"),
        Err(err) => {
            eprintln!("Error inserting recipe: {:?}", err);
            Json("Failed to create recipe")
        }
    }
}

pub async fn get_recipes() -> Json<Vec<Recipe>> {
    println!("Fetching recipes");
    let mut conn: SqliteConnection = establish_connection();
    let data = recipes
        .select(Recipe::as_select())
        .load::<Recipe>(&mut conn)
        .expect("Error fetching recipes");

    println!("Fetched recipes: {:?}", data);

    Json(data)
}
