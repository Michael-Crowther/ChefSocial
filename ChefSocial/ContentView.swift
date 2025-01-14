//
//  ContentView.swift
//  ChefSocial
//
//  Created by Michael Crowther on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("I love you, Suzy, from Mike blah blah blah hello these are Suzys changes :)")
            Text("Test branch changes")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
