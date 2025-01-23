//
//  HomeView.swift
//  ChefSocial
//
//  Created by Michael Crowther on 1/21/25.
//
import SwiftUI
import Foundation

class UserViewModel: ObservableObject {
    struct User: Codable {
        let id: Int
        let name: String
        let user_name: String
        let display_name: String
        let email: String
        let password_hash: String
    }
    
    @Published var user: User? = nil
    
    func fetchUser() async {
        user = try? await fetchData(from: "/random-user")
    }
}

class RecipeViewModel: ObservableObject {
    struct Recipe: Codable {
        let id: Int
        let name: String
        let image_urls: String
        let ingredients: String
        let category: String
        let author: String
    }
    
    @Published var recipes: [Recipe]? = nil
    
    func fetchRecipes() async {
        recipes = try? await fetchData(from: "/recipes")
    }
}

struct HomeView: View {
    @State var maxSize = 100;
    @StateObject var userViewModel = UserViewModel()
    @StateObject var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack {
                if let user = userViewModel.user {
                    Text("Hello, \(user.name)!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                } else {
                    Text("No user loaded yet.")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(hex: "#F15A24"))
            .padding(.bottom, 8)
            
            // Main Content Section
            ScrollView {
                VStack{
                    if let recipes = recipeViewModel.recipes {
                        ForEach(recipes.indices, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(recipes[index].name)
                                    .font(.headline)
                                Text(recipes[index].author)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .frame(height: 200)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
                        
                        .frame(maxWidth: .infinity)
                        .padding(3)
                    } else {
                        Text("No recipes available.")
                            .padding()
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await userViewModel.fetchUser()
                await recipeViewModel.fetchRecipes()
            }
        }
    }
}

#Preview {
    ContentView()
}
