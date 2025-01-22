//
//  HomeView.swift
//  ChefSocial
//
//  Created by Michael Crowther on 1/21/25.
//
import SwiftUI
import Foundation

class ViewModel: ObservableObject {
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

class ViewModel: ObservableObject {
    //fetch recipes here
}

struct HomeView: View {
    @State var maxSize = 100;
    @StateObject var viewModel = ViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack {
                if let user = viewModel.user {
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
            .background(Color.orange)
            .padding(.bottom, 8)
            
            // Main Content Section
            ScrollView {
                VStack{
                    ForEach(0..<30, id: \.self) { index in
                        Text("Item \(index + 1)")
                            .padding()
                            .frame(maxWidth: .infinity, idealHeight: 300)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchUser()
            }
        }
    }
}

#Preview {
    ContentView()
}
