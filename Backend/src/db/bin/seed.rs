use diesel::prelude::*;
use dotenvy::dotenv;

use rust_backend::db::establish_connection;
use rust_backend::db::models::NewUser;
use rust_backend::db::schema::users::dsl::*;

use fake::faker::internet::en::FreeEmail;
use fake::faker::name::en::{FirstName, LastName};
use fake::Fake;

fn main() {
    //load env vars from .env
    //blah
    dotenv().ok();

    //connect to db
    let conn = &mut establish_connection();

    let num_fake_users = 10;
    let mut new_users = Vec::new();

    for _ in 0..num_fake_users {
        let first_name: String = FirstName().fake();
        let last_name: String = LastName().fake();
        let fake_email = FreeEmail().fake();

        //construct NewUser
        let fake_user = NewUser {
            name: format!("{} {}", first_name, last_name),
            user_name: format!("{}_{}", first_name.to_lowercase(), last_name.to_lowercase()),
            display_name: format!("{} {}", first_name, last_name),
            email: fake_email,
            password_hash: "abcd".to_string(),
        };

        new_users.push(fake_user);
    }

    // use batch insert to insert all users at once
    let inserted_users = diesel::insert_into(users)
        .values(&new_users)
        .execute(conn)
        .expect("Error inserting fake users");

    // let mut new_recipes = Vec::new();

    // for fake_recipe in fake_recipes() {
    //     new_recipes.push(fake_recipe);
    // }

    // let inserted_recipes = diesel::insert_into(recipes)
    //     .values(&new_recipes)
    //     .execute(conn)
    //     .expect("Error inserting fake recipes");

    println!("Inserted {} fake users", inserted_users);
    //println!("Inserted {} fake recipes", inserted_recipes);
}
