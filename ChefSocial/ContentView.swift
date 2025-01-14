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
        //body is required by View protocol. It contains logic and visual representation of what is in the View. `some View` is a return type. It returns a View element
        
        Text("Testing Animal List Viewww") //declarative statement. We should look more into declarative vs. imperative programming
        
        //This is how you initialize an array
        let animals = ["Dog", "Cat", "Dolphin", "Elephant"]
        
        //NavigationView is a nav container that gives us goodies like a Title, and the ability to navigate between links
        NavigationView {
            //List displays a vertically scrollable list of items, all self-identifying here
            List(animals, id: \.self) { animal in
                Text(animal) //Create a Text element for each animal
            }
            .navigationTitle("Animals")
        }
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
