import Foundation

func fetchData<T: Decodable>(from url: URL) async throws -> T {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(T.self, from: data)
}
