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
    let inserted_count = diesel::insert_into(users)
        .values(&new_users)
        .execute(conn)
        .expect("Error inserting fake users");

    println!("Inserted {} fake users", inserted_count);
}
