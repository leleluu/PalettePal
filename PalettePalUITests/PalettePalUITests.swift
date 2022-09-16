import XCTest

class PalettePalUITests: XCTestCase {
    
    var app: XCUIApplication!
    var randomPaletteScreen: RandomPaletteScreen!
    var savePaletteScreen: SavePaletteScreen!
    var paletteCollection: PaletteCollectionScreen!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("UI-Testing")
        app.launch()
        
        randomPaletteScreen = RandomPaletteScreen(app: app)
        savePaletteScreen = SavePaletteScreen(app: app)
        paletteCollection = PaletteCollectionScreen(app: app)
    }

    func testAddingNewPalette() throws {
        
        // Given
        let dummyPaletteName = "dummy palette name"
        
        // When
        randomPaletteScreen.bookmarkButton.tap()
        savePaletteScreen.paletteNameTextField.typeText(dummyPaletteName)
        savePaletteScreen.saveButton.tap()
        savePaletteScreen.switchTab(to: .myPalettes)
        
        // Then
        XCTAssertEqual(paletteCollection.palettes.count, 1)
        XCTAssertEqual(paletteCollection.palettes.staticTexts.firstMatch.label, dummyPaletteName)
        
    }
}
