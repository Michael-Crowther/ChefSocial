// @generated automatically by Diesel CLI.

diesel::table! {
    categories (id) {
        id -> Integer,
        name -> Text,
    }
}

diesel::table! {
    difficulties (id) {
        id -> Integer,
        name -> Text,
    }
}

diesel::table! {
    ingredients (id) {
        id -> Integer,
        recipe_id -> Integer,
        name -> Text,
    }
}

diesel::table! {
    instructions (id) {
        id -> Integer,
        recipe_id -> Integer,
        step_number -> Integer,
        description -> Text,
    }
}

diesel::table! {
    recipes (id) {
        id -> Integer,
        name -> Text,
        image_urls -> Text,
        prep_time -> Nullable<Integer>,
        cook_time -> Nullable<Integer>,
        total_time -> Nullable<Integer>,
        servings -> Nullable<Integer>,
        difficulty -> Nullable<Integer>,
        calories -> Nullable<Integer>,
        macronutrients -> Nullable<Text>,
        rating -> Nullable<Float>,
        review_count -> Nullable<Integer>,
        author -> Nullable<Text>,
        notes -> Nullable<Text>,
        equipment -> Nullable<Text>,
        dietary_info -> Nullable<Text>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
        category -> Integer,
    }
}

diesel::table! {
    users (id) {
        id -> Integer,
        name -> Text,
        user_name -> Text,
        display_name -> Text,
        email -> Text,
        password_hash -> Text,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    categories,
    difficulties,
    ingredients,
    instructions,
    recipes,
    users,
);
