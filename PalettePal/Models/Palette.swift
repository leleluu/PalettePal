import Foundation
import UIKit

struct Palette: Equatable {
    
    // MARK: - Properties
    
    private var id = UUID()

    let name: String
    let colors: [UIColor]

    init(name: String, colors: [UIColor]) {
        self.name = name
        self.colors = colors
    }
    
}

extension Palette: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case colors
    }

    init(from decoder: Decoder) {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(UUID.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            let colorData = try container.decode(Data.self, forKey: .colors)
            
            guard let restoredColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? [UIColor] else {
                fatalError("Debug: Failed to restore data to array of UIColor.")
            }
            
            colors = restoredColor
            
        } catch {
            fatalError("Debug: Failed to decode.")
        }

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)

        let colorData = try NSKeyedArchiver.archivedData(withRootObject: colors, requiringSecureCoding: false)
        try container.encode(colorData, forKey: .colors)
    }
}


