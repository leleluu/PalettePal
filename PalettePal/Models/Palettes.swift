import Foundation

struct Palettes: Codable {
    
    // MARK: - Private Properties
    
    static private let userDefaultsKey = "paletteCollection"
    
    static var all: [Palette] {
        get {
            // If there is no data e.g on first launch or if no palettes have been saved, return an empty array
            guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
                return []
            }
            
            // Crash if there is an issue decoding for easier debugging
            let decoder = JSONDecoder()
            guard let decodedPalettes = try? decoder.decode([Palette].self, from: data) else {
                fatalError("Debug: Failed to decode saved palettes.")
            }
            
            return decodedPalettes
        }
        
        set {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(newValue) {
                UserDefaults.standard.set(data, forKey: userDefaultsKey)
            }
        }
    }
    
    // MARK: - Public Methods
    
    static func addPalette(palette: Palette) {
        all.insert(palette, at: 0)
    }
    
    static func remove(_ palette: Palette) {
        all.removeAll(where: {$0 == palette})
    }
}
