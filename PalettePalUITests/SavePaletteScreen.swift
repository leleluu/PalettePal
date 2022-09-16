import XCTest

class SavePaletteScreen: Screen {
    
    lazy var paletteNameTextField = app.textFields["palette name textfield"]
    
    lazy var saveButton =  app.navigationBars["PalettePal.SavePaletteView"].buttons["Save"]
    
}
