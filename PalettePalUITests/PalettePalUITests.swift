import XCTest

class PalettePalUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("UI-Testing")
        app.launch()
    }

    func testAddingNewPalette() throws {
        
        // Given
        let bookmarkButton = app.navigationBars["Palette Generator"].buttons["bookmark"]
        let saveButton =  app.navigationBars["PalettePal.SavePaletteView"].buttons["Save"]
        let paletteNameTextField = app.textFields.element
        let myPalettesTab = app.tabBars["Tab Bar"].buttons["My Palettes"]
        let dummyPaletteName = "dummy palette name"
        
        // When
        bookmarkButton.tap()
        paletteNameTextField.typeText(dummyPaletteName)
        saveButton.tap()
        myPalettesTab.tap()
        
        // Then
        XCTAssertEqual(app.collectionViews.cells.count, 1)
        XCTAssertEqual(app.collectionViews.cells.staticTexts.firstMatch.label, dummyPaletteName)
        
    }
}
