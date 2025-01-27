use diesel::prelude::*;
use rand::Rng;

use crate::db::establish_connection;
use crate::db::models::User;
use crate::db::schema::users::dsl::*;
use axum::extract::Json;

pub async fn get_random_user() -> Json<Option<User>> {
    let mut conn: SqliteConnection = establish_connection();
    let user_count: i64 = users
        .count()
        .get_result(&mut conn)
        .expect("Error counting users");

    if user_count == 0 {
        return Json(None);
    }

    let random_offset = rand::thread_rng().gen_range(0..user_count) as i64;

    let random_user = users
        .limit(1)
        .offset(random_offset)
        .get_result(&mut conn)
        .optional()
        .expect("Error loading random user");

    Json(random_user)
}
