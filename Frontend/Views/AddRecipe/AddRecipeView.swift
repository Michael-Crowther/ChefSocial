import SwiftUI

struct AddRecipeView: View {
    // Recipe fields
    @State private var name: String = ""
    //@State private var imageUrls: String = ""
    @State private var ingredients: [String] = [""]
    @State private var instructions: [String] = [""]
    @State private var category: String = ""
    @State private var tags: String = ""
    @State private var prepTime: String = ""
    @State private var cookTime: String = ""
    @State private var totalTime: String = ""
    @State private var servings: String = ""
    @State private var difficulty: String = ""
    @State private var calories: String = ""
    @State private var macronutrients: String = ""
    @State private var rating: String = ""
    @State private var reviewCount: String = ""
    @State private var source: String = ""
    @State private var author: String = ""
    @State private var notes: String = ""
    @State private var equipment: String = ""
    @State private var dietaryInfo: String = ""
    
    func saveRecipe() {
        // Validation and save logic here
        print("Saving recipe with name: \(name)")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Name", text: $name)
                    
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
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    
                    Button(action: {
                        ingredients.append("")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Ingredient")
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
                            Image(systemName: "plus.circle.fill")
                            Text("Add Instruction")
                        }
                    }
                }
                
                Section(header: Text("Optional Information")) {
                    TextField("Category", text: $category)
                    TextField("Tags (comma-separated)", text: $tags)
                    TextField("Prep Time (minutes)", text: $prepTime)
                        .keyboardType(.numberPad)
                    TextField("Cook Time (minutes)", text: $cookTime)
                        .keyboardType(.numberPad)
                    TextField("Total Time (minutes)", text: $totalTime)
                        .keyboardType(.numberPad)
                    TextField("Servings", text: $servings)
                        .keyboardType(.numberPad)
                    TextField("Difficulty (1-5)", text: $difficulty)
                        .keyboardType(.numberPad)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Macronutrients", text: $macronutrients)
                    TextField("Rating (0.0-5.0)", text: $rating)
                        .keyboardType(.decimalPad)
                    TextField("Review Count", text: $reviewCount)
                        .keyboardType(.numberPad)
                    TextField("Source", text: $source)
                    TextField("Author", text: $author)
                    TextField("Notes", text: $notes)
                    TextField("Equipment", text: $equipment)
                    TextField("Dietary Info", text: $dietaryInfo)
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
