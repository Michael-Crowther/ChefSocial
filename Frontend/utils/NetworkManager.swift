import Foundation

func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
    let baseURL = "http://127.0.0.1:8080" //local IP address
    guard let fullURL = URL(string: baseURL + endpoint) else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: fullURL)
    return try JSONDecoder().decode(T.self, from: data)
}
