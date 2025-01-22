use diesel::prelude::*;

use crate::db::models::Recipe;
use crate::db::schema::recipes::dsl::*;

pub fn fetch_recipes(conn: &mut SqliteConnection) -> Vec<Recipe> {
    // Fetch all recipes from the database
    recipes
        .load::<Recipe>(conn)
        .expect("Error fetching recipes")
}
