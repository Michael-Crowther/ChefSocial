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

struct ProfileListView: View {
    @State var maxSize = 100;
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                Text("Hello \(user.name)!")
            } else {
                Text("No user loaded yet.")
            }
        }.onAppear{
            Task {
                await viewModel.fetchUser()
            }
        }
    }
}

struct GalleryView: View {
    var body: some View {
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
