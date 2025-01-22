import Foundation


func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
    let baseURL = "http://127.0.0.1:3001" // Replace with config for production
    guard let fullURL = URL(string: baseURL + endpoint) else {
        throw URLError(.badURL)
    }

    print("Fetching data from: \(fullURL)")

    let (data, response) = try await URLSession.shared.data(from: fullURL)
    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
        throw URLError(.badServerResponse)
    }

    let decoder = JSONDecoder()
    // Add any custom decoding configurations here
    return try decoder.decode(T.self, from: data)
}
