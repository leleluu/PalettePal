import UIKit

struct InspirationalPaletteCollection {
    
    // MARK: - Properties

    let name: String
    let palettes: [InspirationalPalette]
    
    // MARK: - Initialization
    
    init(name: String, palettes: [InspirationalPalette]) {
        self.name = name
        self.palettes = palettes
    }
    
}

