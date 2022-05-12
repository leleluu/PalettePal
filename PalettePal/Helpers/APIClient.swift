import Foundation

class APIClient {
    
    func fetchRandomPalette(completion: @escaping ((ColorMindPalette) -> Void)) {
        
        let url = URL(string: "http://colormind.io/api/")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "{\"model\":\"default\"}".data(using: .utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            data, response, error in
            
            let decoder = JSONDecoder()
            let result = try! decoder.decode(ColorMindPalette.self, from: data!)
            completion(result)
        }
        task.resume()
    }
}


// MARK: - Model

struct ColorMindPalette: Decodable {
    let result: [[Int]]
}
