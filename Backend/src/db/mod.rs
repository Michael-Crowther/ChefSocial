// If you want `db.rs` as a submodule:
pub mod db;       // defines `db::establish_connection`
pub mod models;    // your model structs
pub mod schema;   // your Diesel table definitions

// Optionally, re-export items for convenience:
pub use db::establish_connection;