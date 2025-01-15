//
//  ContentView.swift
//  ChefSocial
//
//  Created by Michael Crowther and Suzy Hludzinski on 1/14/25.
//

import SwiftUI

//The View protocol represents a peice of UI. A struct is lightweight data structure, encapsulated by {}
struct AnimalListView: View {
    var body: some View {
        //body is required by View protocol. It contains logic and visual representation of what is in the View. `some ===============================iew` is a return type. It returns a View element
        
        Text("Hello Chef!") //declarative statement. We should look more into declarative vs. imperative programming
        
        //This is how you initialize an array
        let profile = ["Personal Information", "Friends and Followers", "Saved Posts", "Recipe", "Settings"]
        
        //NavigationView is a nav container that gives us goodies like a Title, and the ability to navigate between links
        NavigationView {
            //List displays a vertically scrollable list of items, all self-identifying here
            List(profile, id: \.self) { category in
                Text(category) //Create a Text element for each animal
            }
            .navigationTitle("Profile")
        }
        
        
        Button("Tap me") {
            print("Button tapped!")
                
        }
        .frame(width: 200, height: 50) // Set width and height
        //.padding() // Add some padding inside the button for better spacing
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.orange, .red]), // Gradient colors
                startPoint: .top, // Gradient start point
                endPoint: .bottom // Gradient end point
            )
        )
        .cornerRadius(75) // Rounded corners
        .foregroundColor(.white) // Change the text color
        .opacity(0.9) // Set transparency of the button (background in this case)
        .shadow(radius: 10) // Add a shadow for better visibility
        .scaleEffect(1)
        .animation(.linear(duration: 1), value: 1)
    }
}

//ContentView is required for the #Preview method
struct ContentView: View {
    var body: some View {
        AnimalListView()
    }
}

//Built in SwiftUI method for displaying View on device
#Preview {
    AnimalListView()
}
