import UIKit

struct InspirationalPalette {
    
    // MARK: - Properties

    let palette: Palette
    let imageName: String
    
    var name: String {
        get {
            palette.name
        }
    }
    
    var colors: [UIColor] {
        get {
            palette.colors
        }
    }

    
    // MARK: - Initialization
    
    init(palette: Palette, imageName: String) {
        self.palette = palette
        self.imageName = imageName
    }
    
}
