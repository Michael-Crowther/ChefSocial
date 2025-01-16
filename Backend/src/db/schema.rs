// @generated automatically by Diesel CLI.

diesel::table! {
    users (id) {
        id -> Integer,
        name -> Text,
        user_name -> Text,
        display_name -> Text,
        email -> Text,
        password_hash -> Text,
    }
}
