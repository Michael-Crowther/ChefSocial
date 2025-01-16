import SwiftUI
import Foundation

//ViewModels are intended to fetch data from the backend and manage the state that the ProfileListView observes
class ViewModel: ObservableObject {
    //@Published allows for reactivity when backendResponse changes, it changes ProfileListView viewModel instance
    @Published var backendResponse: String? = nil

    func fetch(){
        let url = URL(string: "http://127.0.0.1:8080")!
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else { return }
            
            let responseString = String(data: data, encoding: .utf8);
            
            DispatchQueue.main.async {
                self.backendResponse = responseString
            }
        }
        task.resume()
    }
}

//View is responsible for displaying UI elements, initiating data fetching, and reacting to state changes
struct ProfileListView: View {
    @State var maxSize = 100;
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            // Display the backend response
            Text(viewModel.backendResponse ?? "Cannot access backend...")
                .underline(color: .red)
                .bold()
                .padding()
        }.onAppear{
            viewModel.fetch()
        }
        
        
        let profile = ["Personal Information", "Friends and Followers", "Saved Posts", "Recipes", "Settings"]
        
        NavigationView {
            List(profile.indices, id: \.self) { index in
                HStack {
                    Text(profile[index])
                    Spacer()
                    Image(systemName: index % 2 == 0 ? "star" : "star.fill")
                }
                
            }
            .navigationTitle("Profile")
        }
        
        
        Button("Switch Users") {
            print("Button tapped!")
            
        }
        .frame(width: 200, height: 50) // Set width and height
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
        .animation(.linear(duration: 2), value: 2)
    }
}

struct GalleryView: View {
    var body: some View {
        Button("Log Out") {}
        ProfileListView()
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
