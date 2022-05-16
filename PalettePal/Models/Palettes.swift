import Foundation

struct Palettes {
    
    // MARK: - Private Properties
    
    static private(set) var all: [Palette] = []
    
    // MARK: - Public Methods
    
    static func addPalette(palette: Palette) {
        all.append(palette)
    }
    
    static func remove(_ palette: Palette) {
        all.removeAll(where: {$0 == palette})
    }
}
