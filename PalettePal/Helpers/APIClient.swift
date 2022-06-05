import Foundation

class APIClient {
    
    enum NetworkError: Error, LocalizedError {
        case generic
    }
    
    func fetchRandomPalette(completion: @escaping ((Result<ColorMindPalette, NetworkError>) -> Void)) {
        
        let url = URL(string: "http://colormind.io/api/")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "{\"model\":\"default\"}".data(using: .utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            data, response, error in

            guard let data = data else {
                completion(.failure(NetworkError.generic))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ColorMindPalette.self, from: data)
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


// MARK: - Model

struct ColorMindPalette: Decodable {
    let result: [[Int]]
}
