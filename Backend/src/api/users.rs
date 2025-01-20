use diesel::prelude::*;
use rand::Rng;

use crate::db::models::User;
use crate::db::schema::users::dsl::*;

pub fn fetch_random_user(conn: &mut SqliteConnection) -> Option<User> {
    let user_count: i64 = users
        .count()
        .get_result(conn)
        .expect("Error counting users");

    if user_count == 0 {
        return None;
    }

    let random_offset = rand::thread_rng().gen_range(0..user_count) as i64;

    let random_user = users
        .limit(1)
        .offset(random_offset)
        .get_result(conn)
        .optional()
        .expect("Error loading random user");

    random_user
}
