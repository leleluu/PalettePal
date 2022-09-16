import XCTest

class Screen {
    
    // MARK: - Properties
    
    let app: XCUIApplication
    
    enum Tab: String {
        case generator = "Generator"
        case inspiration = "Inspiration"
        case myPalettes = "My Palettes"
    }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Public API
    
    func switchTab(to destination: Tab) {
        app.tabBars["Tab Bar"].buttons[destination.rawValue].tap()
    }
}
