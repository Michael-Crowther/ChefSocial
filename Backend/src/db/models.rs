use crate::db::schema::users;
use diesel::prelude::*;
use serde::{Deserialize, Serialize};
//use chrono::NaiveDate;

#[derive(Queryable, Serialize, Deserialize)]
pub struct User {
    pub id: i32,
    pub name: String,
    pub user_name: String,
    pub display_name: String,
    pub email: String,
    pub password_hash: String,
    //pub created_at: NaiveDate,
}

#[derive(Insertable, Serialize, Deserialize)]
#[diesel(table_name = users)]
pub struct NewUser {
    pub name: String,
    pub user_name: String,
    pub display_name: String,
    pub email: String,
    pub password_hash: String,
    //pub created_at: NaiveDate,
}
