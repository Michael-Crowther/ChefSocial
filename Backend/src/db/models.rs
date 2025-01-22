use crate::db::schema::{recipes, users};
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

#[derive(Queryable, Serialize, Deserialize)]
pub struct Recipe {
    pub id: i32,
    pub name: String,
    pub image_urls: String,
    pub ingredients: String,
    pub instructions: String,
    pub category: Option<String>,
    pub tags: Option<String>,
    pub prep_time: Option<i32>,
    pub cook_time: Option<i32>,
    pub total_time: Option<i32>,
    pub servings: Option<i32>,
    pub difficulty: Option<i32>,
    pub calories: Option<i32>,
    pub macronutrients: Option<String>,
    pub rating: Option<f32>,
    pub review_count: Option<i32>,
    pub source: Option<String>,
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
    pub ingredients: String,
    pub instructions: String,
    pub category: Option<String>,
    pub tags: Option<String>,
    pub prep_time: Option<i32>,
    pub cook_time: Option<i32>,
    pub total_time: Option<i32>,
    pub servings: Option<i32>,
    pub difficulty: Option<i32>,
    pub calories: Option<i32>,
    pub macronutrients: Option<String>,
    pub rating: Option<f32>,
    pub review_count: Option<i32>,
    pub source: Option<String>,
    pub author: Option<String>,
    pub notes: Option<String>,
    pub equipment: Option<String>,
    pub dietary_info: Option<String>,
}
