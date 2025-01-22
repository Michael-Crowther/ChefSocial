import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            AddRecipeView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add Recipe")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.orange)
        
    }
}

#Preview {
    ContentView()
}
