use diesel::prelude::*;

use crate::db::establish_connection;
use crate::db::models::{NewRecipe, Recipe};
use crate::db::schema::recipes::dsl::*;
use axum::{extract::Json, response::IntoResponse};

pub async fn get_recipes() -> Json<Vec<Recipe>> {
    let mut conn: SqliteConnection = establish_connection();
    let data = recipes
        .load::<Recipe>(&mut conn)
        .expect("Error fetching recipes");

    Json(data)
}

pub async fn create_recipe(Json(new_recipe): Json<NewRecipe>) -> impl IntoResponse {
    let mut conn: SqliteConnection = establish_connection();
    diesel::insert_into(recipes)
        .values(&new_recipe)
        .execute(&mut conn)
        .expect("Error creating recipe.");
}
