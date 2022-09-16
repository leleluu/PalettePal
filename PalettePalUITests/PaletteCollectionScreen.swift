import XCTest

class PaletteCollectionScreen: Screen {
    
    // MARK: - Properties
    
    lazy var palettes = app.collectionViews["Palette Collection"].cells
    
    lazy var bookmarkButton = app.navigationBars["Palette Generator"].buttons["bookmark"]
}

