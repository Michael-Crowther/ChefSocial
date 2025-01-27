use crate::db::models::NewRecipe;

pub fn fake_recipes() -> Vec<NewRecipe> {
    vec![
        NewRecipe {
            name: "Shepherd's Pie".to_string(),
            image_urls: "".to_string(), // Add URLs for images if available
            ingredients: "Ground beef or lamb, vegetables, and a creamy mashed potato topping. Common ingredients include potatoes, onions, carrots, and sometimes a touch of ketchup or other seasonings to enhance the flavor."
                .to_string(),
            instructions: "1. Dice the vegetables and sauté in olive oil. Add the meat and cook thoroughly. \
            2. Peel the potatoes, boil, and mash them. \
            3. Add the cooked vegetables and meat to a glass dish, spread the mashed potatoes on top, and bake. \
            4. Serve with gravy or ketchup for added flavor."
                .to_string(),
            category: Some("Dinner".to_string()),
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
        NewRecipe {
            name: "Pumpkin Pie".to_string(),
            image_urls: "".to_string(), // Add URLs for images if available
            ingredients: "Pumpkin puree, sugar, eggs, cinnamon, nutmeg, ginger, and a flaky pie crust.".to_string(),
            instructions: "1. Preheat the oven to 350°F (175°C). \
            2. In a bowl, mix pumpkin puree, sugar, eggs, and spices until smooth. \
            3. Pour the mixture into a prepared pie crust. \
            4. Bake for 50-60 minutes until set. Cool before serving.".to_string(),
            category: Some("Dessert".to_string()),
            author: Some("Michael Jackson".to_string()),
            dietary_info: Some("Gluten Free".to_string()),
            notes: None,
            rating: Some(10.0),
            review_count: Some(50),
            prep_time: Some(15),
            cook_time: Some(60),
            equipment: Some("Electric Mixer or Whisk".to_string()),
            total_time: Some(75),
            servings: Some(8),
            difficulty: Some(1),
            calories: Some(320),
            macronutrients: Some("{\"carbs\": 40, \"protein\": 5, \"fats\": 12}".to_string()),
        },
        NewRecipe {
            name: "Vegetable Stir Fry".to_string(),
            image_urls: "".to_string(), // Add URLs for images if available
            ingredients: "Bell peppers, broccoli, carrots, snap peas, soy sauce, garlic, and ginger.".to_string(),
            instructions: "1. Heat a large skillet or wok over medium-high heat. \
            2. Add oil, garlic, and ginger, and stir-fry for 1 minute. \
            3. Add the vegetables and stir-fry for 5-7 minutes. \
            4. Add soy sauce and stir well. Serve with rice or noodles.".to_string(),
            category: Some("Dinner".to_string()),
            author: Some("Billy Bob".to_string()),
            dietary_info: Some("Gluten Free".to_string()),
            equipment: None,
            notes: None,
            rating: Some(10.0),
            review_count: Some(50),
            prep_time: Some(10),
            cook_time: Some(15),
            total_time: Some(25),
            servings: Some(4),
            difficulty: Some(1),
            calories: Some(250),
            macronutrients: Some("{\"carbs\": 30, \"protein\": 5, \"fats\": 10}".to_string()),
        },
    ]
}
