import Foundation


func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
    let baseURL = "http://127.0.0.1:3001" // Replace with config for production
    guard let fullURL = URL(string: baseURL + endpoint) else {
        throw URLError(.badURL)
    }


    // Add timestamp
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    
    print("[\(timestamp)] Fetching data from: \(fullURL)")

    let (data, response) = try await URLSession.shared.data(from: fullURL)
    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
        throw URLError(.badServerResponse)
    }

    let decoder = JSONDecoder()
    // Add any custom decoding configurations here
    return try decoder.decode(T.self, from: data)
}

func postData<U: Encodable>(to endpoint: String, with payload: U) async throws {
    let baseURL = "http://127.0.0.1:3001" // Replace with config for production
    guard let fullURL = URL(string: baseURL + endpoint) else {
        throw URLError(.badURL)
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    print("[\(timestamp)] Posting data to: \(fullURL)")

    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    let jsonData = try encoder.encode(payload)

    var request = URLRequest(url: fullURL)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData

    let (data, response) = try await URLSession.shared.data(for: request)

    // Convert response to a readable string
    if let responseString = String(data: data, encoding: .utf8) {
        print("Server Response: \(responseString)")
    }

    guard let httpResponse = response as? HTTPURLResponse else {
        throw URLError(.badServerResponse)
    }

    print("HTTP Status Code:", httpResponse.statusCode)
    if !(200..<300).contains(httpResponse.statusCode) {
        throw URLError(.badServerResponse)
    }
}
