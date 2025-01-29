use diesel::{prelude::QueryableByName, sql_types::Integer};

#[derive(QueryableByName, Debug)]
pub struct LastInsertRowId {
    #[diesel(sql_type = Integer)]
    pub last_insert_rowid: i32,
}
