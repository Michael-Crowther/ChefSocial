use crate::db::schema::{categories, difficulties, ingredients, instructions, recipes, users};
use chrono::NaiveDateTime;
use diesel::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(Queryable, Serialize, Deserialize)]
pub struct User {
    pub id: i32,
    pub name: String,
    pub user_name: String,
    pub display_name: String,
    pub email: String,
    pub password_hash: String,
    pub created_at: NaiveDateTime,
    pub updated_at: NaiveDateTime,
}

#[derive(Insertable, Serialize, Deserialize)]
#[diesel(table_name = users)]
pub struct NewUser {
    pub name: String,
    pub user_name: String,
    pub display_name: String,
    pub email: String,
    pub password_hash: String,
}

#[derive(Queryable, Serialize, Deserialize, Selectable)]
#[diesel(table_name = recipes)]
#[derive(Debug)]
pub struct Recipe {
    pub id: i32,
    pub name: String,
    pub image_urls: String,
    pub category: i32,
    pub prep_time: Option<i32>,
    pub cook_time: Option<i32>,
    pub total_time: Option<i32>,
    pub servings: Option<i32>,
    pub difficulty: Option<i32>,
    pub calories: Option<i32>,
    pub macronutrients: Option<String>,
    pub rating: Option<f32>,
    pub review_count: Option<i32>,
    pub author: Option<String>,
    pub notes: Option<String>,
    pub equipment: Option<String>,
    pub dietary_info: Option<String>,
    pub created_at: NaiveDateTime,
    pub updated_at: NaiveDateTime,
}

#[derive(Insertable, Serialize, Deserialize)]
#[diesel(table_name = recipes)]
pub struct NewRecipe {
    pub name: String,
    pub image_urls: String,
    pub category: i32,
    pub prep_time: Option<i32>,
    pub cook_time: Option<i32>,
    pub total_time: Option<i32>,
    pub servings: Option<i32>,
    pub difficulty: Option<i32>,
    pub calories: Option<i32>,
    pub macronutrients: Option<String>,
    pub rating: Option<f32>,
    pub review_count: Option<i32>,
    pub author: Option<String>,
    pub notes: Option<String>,
    pub equipment: Option<String>,
    pub dietary_info: Option<String>,
}

#[derive(Deserialize)]
pub struct NewRecipeWithDetails {
    pub recipe: NewRecipe,
    pub ingredients: Vec<String>,
    pub instructions: Vec<String>,
}

#[derive(Queryable, Identifiable, Associations)]
#[diesel(belongs_to(Recipe, foreign_key = recipe_id))]
#[diesel(table_name = ingredients)]
pub struct Ingredient {
    pub id: i32,
    pub recipe_id: i32,
    pub name: String,
}

#[derive(Insertable)]
#[diesel(table_name = ingredients)]
pub struct NewIngredient {
    pub recipe_id: i32,
    pub name: String,
}

#[derive(Queryable, Identifiable, Associations)]
#[diesel(belongs_to(Recipe, foreign_key = recipe_id))]
#[diesel(table_name = instructions)]
pub struct Instruction {
    pub id: i32,
    pub recipe_id: i32,
    pub step_number: i32,
    pub description: String,
}

#[derive(Insertable)]
#[diesel(table_name = instructions)]
pub struct NewInstruction {
    pub recipe_id: i32,
    pub step_number: i32,
    pub description: String,
}

#[derive(Queryable, Identifiable)]
#[diesel(table_name = categories)]
pub struct Category {
    pub id: i32,
    pub name: String,
}

#[derive(Queryable, Identifiable)]
#[diesel(table_name = difficulties)]
pub struct Difficulty {
    pub id: i32,
    pub name: String,
}
