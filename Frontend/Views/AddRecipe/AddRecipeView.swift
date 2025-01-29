import SwiftUI

struct AddRecipeView: View {
    @State private var recipeDetails = RecipeDetails()
    
    struct RecipeDetails {
        var name: String = ""
        var imageUrls: String = ""
        var category: RecipeCategory = .appetizers
        var prepTime: String = ""
        var cookTime: String = ""
        var servings: String = ""
        var difficulty: RecipeDifficulty = .beginner
        var calories: String = ""
        var macronutrients: String = ""
        var notes: String = ""
        var equipment: String = ""
        var dietaryInfo: String = ""
    }
    
    @State private var ingredients: [String] = [""]
    @State private var instructions: [String] = [""]
    
    enum RecipeCategory: Int, CaseIterable, Identifiable {
        case appetizers = 1, sides, breakfast, lunch, dinner, dessert, drinks, other
        var id: Int { rawValue }
        var displayName: String {
            switch self {
            case .appetizers: return "Appetizers"
            case .sides: return "Sides"
            case .breakfast: return "Breakfast"
            case .lunch: return "Lunch"
            case .dinner: return "Dinner"
            case .dessert: return "Dessert"
            case .drinks: return "Drinks"
            case .other: return "Other"
            }
        }
    }
    
    enum RecipeDifficulty: Int, CaseIterable, Identifiable {
        case beginner = 1, intermediate, expert
        var id: Int { rawValue }
        var displayName: String {
            switch self {
            case .beginner: return "Beginner"
            case .intermediate: return "Intermediate"
            case .expert: return "Expert"
            }
        }
    }

    struct RecipeRequest: Encodable {
        let name: String
        let imageUrls: String
        let category: Int32
        let prepTime: Int?
        let cookTime: Int?
        let servings: Int?
        let difficulty: Int32
        let calories: Int?
        let macronutrients: String?
        let notes: String?
        let dietaryInfo: String?
        let equipment: String?
    }
    
    struct RecipePayload: Encodable {
        let recipe: RecipeRequest
        let ingredients: [String]
        let instructions: [String]
    }
    
    func saveRecipe() {
        let recipe = RecipeRequest(
            name: recipeDetails.name,
            imageUrls: recipeDetails.imageUrls,
            category: Int32(recipeDetails.category.rawValue),
            prepTime: Int(recipeDetails.prepTime),
            cookTime: Int(recipeDetails.cookTime),
            servings: Int(recipeDetails.servings),
            difficulty: Int32(recipeDetails.difficulty.rawValue),
            calories: Int(recipeDetails.calories),
            macronutrients: recipeDetails.macronutrients,
            notes: recipeDetails.notes,
            dietaryInfo: recipeDetails.dietaryInfo,
            equipment: recipeDetails.equipment
        )

        let payload = RecipePayload(recipe: recipe, ingredients: ingredients, instructions: instructions)

        Task {
            do {
                try await postData(to: "/recipes", with: payload)
                print("Recipe saved successfully!")
            } catch {
                print("Failed to save recipe: \(error)")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Name", text: $recipeDetails.name)
                    
                    Picker("Category", selection: $recipeDetails.category) {
                        ForEach(RecipeCategory.allCases) { category in
                            Text(category.displayName).tag(category as RecipeCategory)
                        }
                    }
                    
                    TextField("Servings", text: $recipeDetails.servings)
                        .keyboardType(.numberPad)
                }
                
                // Ingredients Section
                Section(header: Text("Ingredients")) {
                    ForEach(ingredients.indices, id: \.self) { index in
                        HStack {
                            TextField("Ingredient", text: $ingredients[index])
                            
                            Button(action: {
                                ingredients.remove(at: index)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(Color(hex: "#F15A24"))
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    
                    Button(action: {
                        ingredients.append("")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill").foregroundColor(Color (hex: "#F15A24"))
                            Text("Add Ingredient").foregroundColor(Color (hex: "#F15A24"))
                        }
                    }
                }
                
                Section(header: Text("Instructions")) {
                    ForEach(instructions.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text("Step \(index + 1)")
                                .font(.headline)
                                .padding(.bottom, 2)
                                .padding(.top, 3)
                            
                            TextEditor(text: $instructions[index])
                                .frame(minHeight: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                                .cornerRadius(8)
                                .padding(.bottom, 8)
                            
                        }
                    }
                    
                    Button(action: {
                        instructions.append("")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill").foregroundColor(Color (hex: "#F15A24"))
                            Text("Add Instruction").foregroundColor(Color (hex: "#F15A24"))
                        }
                    }
                }
                
                
                Section(header: Text("Optional Information")) {
                    TextField("Prep Time (minutes)", text: $recipeDetails.prepTime)
                        .keyboardType(.numberPad)
                    TextField("Cook Time (minutes)", text: $recipeDetails.cookTime)
                        .keyboardType(.numberPad)
                    Picker("Difficulty", selection: $recipeDetails.difficulty) {
                        ForEach(RecipeDifficulty.allCases) { difficulty in
                            Text(difficulty.displayName).tag(difficulty as RecipeDifficulty)
                        }
                    }
                    TextField("Calories", text: $recipeDetails.calories)
                        .keyboardType(.numberPad)
                    TextField("Macronutrients", text: $recipeDetails.macronutrients)
                    TextField("Notes", text: $recipeDetails.notes)
                    TextField("Equipment", text: $recipeDetails.equipment)
                    TextField("Dietary Info (Gluten Free, etc.)", text: $recipeDetails.dietaryInfo)
                }
                
                Button(action: saveRecipe) {
                    Text("Save Recipe")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#F15A24"))
                        .cornerRadius(8)
                }
                
            }
            .navigationTitle("Post Recipe")
        }
    }
}

#Preview {
    AddRecipeView()
}
