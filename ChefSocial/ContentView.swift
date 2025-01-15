//
//  ContentView.swift
//  ChefSocial
//
//  Created by Michael Crowther and Suzy Hludzinski on 1/14/25.
//

import SwiftUI

//The View protocol represents a peice of UI. A struct is lightweight data structure, encapsulated by {}
struct ProfileListView: View {
    var body: some View {
        //body is required by View protocol. It contains logic and visual representation of what is in the View. `some ===============================iew` is a return type. It returns a View element
        
        Text("Hello Chef!") //declarative statement. We should look more into declarative vs. imperative programming
        
        //This is how you initialize an array
        let profile = ["Personal Information", "Friends and Followers", "Saved Posts", "Recipe", "Settings"]
        
        //NavigationView is a nav container that gives us goodies like a Title, and the ability to navigate between links
        NavigationView {
            List(profile.indices, id: \.self) { index in //Changed this to pull the indices out of profile array
                HStack { //Horizontal Stack
                    Text(profile[index]) //directly accesses the array elements
                    Spacer() //Space between words and icon. Similar to "justify-between" in CSS
                    Image(systemName: index % 2 == 0 ? "star" : "star.fill") // `%` finds the remainder of index and 2. The remainder is 0 if it's an even number. The remainder is 1 if it's an odd number. This is how you can alternate elements being filled or not. This works because numbers are always even then odd in an alternating fashion
                }
               
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

struct GalleryView: View {
    var body: some View {
        ProfileListView()
        Button("Wuddup") {}

    }
}

struct ContentView: View {
    var body: some View {
        GalleryView()
    }
}



//Built in SwiftUI method for displaying View on device
#Preview {
    GalleryView()
}
