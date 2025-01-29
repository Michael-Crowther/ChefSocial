use crate::db::models::NewRecipe;

use super::models::NewRecipeWithDetails;

pub fn fake_recipes() -> Vec<NewRecipeWithDetails> {
    vec![
        NewRecipeWithDetails {
            recipe: NewRecipe {
                name: "Shepherd's Pie".to_string(),
                image_urls: "".to_string(), // Add URLs for images if available
                category: 5,
                author: Some("James Bond".to_string()),
                dietary_info: Some("Gluten Free".to_string()),
                equipment: None,
                notes: None,
                rating: Some(10.0),
                review_count: Some(50),
                prep_time: Some(20),
                cook_time: Some(30),
                total_time: Some(50),
                servings: Some(5),
                difficulty: Some(1),
                calories: Some(450),
                macronutrients: Some("{\"carbs\": 50, \"protein\": 30, \"fats\": 20}".to_string()),
            },
            ingredients: vec![
                "1 lb ground beef or lamb".to_string(),
                "1 cup diced onions".to_string(),
                "1 cup diced carrots".to_string(),
                "2 cups mashed potatoes".to_string(),
                "1 tbsp olive oil".to_string(),
            ],
            instructions: vec![
                "Dice the vegetables and sauté in olive oil.".to_string(),
                "Add the meat and cook thoroughly.".to_string(),
                "Peel the potatoes, boil, and mash them.".to_string(),
                "Add the cooked vegetables and meat to a glass dish, spread the mashed potatoes on top, and bake.".to_string(),
                "Serve with gravy or ketchup for added flavor.".to_string(),
            ],
        },
        NewRecipeWithDetails {
            recipe: NewRecipe {
                name: "Spaghetti Bolognese".to_string(),
                image_urls: "".to_string(),
                category: 5,
                author: Some("Julia Child".to_string()),
                dietary_info: None,
                equipment: Some("Large pot, strainer".to_string()),
                notes: None,
                rating: Some(8.5),
                review_count: Some(120),
                prep_time: Some(15),
                cook_time: Some(45),
                total_time: Some(60),
                servings: Some(4),
                difficulty: Some(2),
                calories: Some(600),
                macronutrients: Some("{\"carbs\": 70, \"protein\": 25, \"fats\": 15}".to_string()),
            },
            ingredients: vec![
                "1 lb spaghetti".to_string(),
                "1 lb ground beef".to_string(),
                "1 cup diced tomatoes".to_string(),
                "1/2 cup diced onions".to_string(),
                "2 cloves garlic".to_string(),
                "1 tsp olive oil".to_string(),
                "Salt and pepper to taste".to_string(),
            ],
            instructions: vec![
                "Boil the spaghetti according to package instructions.".to_string(),
                "In a pan, sauté the onions and garlic in olive oil.".to_string(),
                "Add the ground beef and cook until browned.".to_string(),
                "Mix in the diced tomatoes and simmer for 20 minutes.".to_string(),
                "Serve the sauce over the spaghetti.".to_string(),
            ],
        },
    ]
}
