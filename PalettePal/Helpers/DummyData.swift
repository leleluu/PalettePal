import Foundation
import UIKit

struct DummyData {
    
    static let inspirationalPaletteCollections: [InspirationalPaletteCollection] = [
        foodPalettes,
        naturePalettes
    ]
    
}

// Individual Food Color Palettes
private let ramenPalette = InspirationalPalette(
    palette: Palette(
        name: "Ramen",
        colors: [
            UIColor.systemOrange,
            UIColor.systemPink,
            UIColor.systemOrange,
            UIColor.systemPink,
            UIColor.systemOrange,
        ]),
    imageName: "ramen"
)

private let greekSaladPalette = InspirationalPalette(
    palette: Palette(
        name: "Greek Salad",
        colors: [
            UIColor.systemGreen,
            UIColor.systemRed,
            UIColor.systemBrown,
            UIColor.systemGreen,
            UIColor.systemRed,
        ]),
    imageName: "ramen"
)

private let pinaColadaPalette = InspirationalPalette(
    palette: Palette(
        name: "Pina Colada",
        colors: [
            UIColor.systemYellow,
            UIColor.systemBrown,
            UIColor.systemOrange,
            UIColor.systemGray,
            UIColor.systemPink,


        ]),
    imageName: "ramen"
)

private let carrotCakePalette = InspirationalPalette(
    palette: Palette(
        name: "Carrot Cake",
        colors: [
            UIColor.systemOrange,
            UIColor.systemMint,
            UIColor.systemBlue,
            UIColor.systemYellow,
            UIColor.systemBrown,
        ]),
    imageName: "ramen"
)

// Individual Nature Color Palettes

private let waterFallPalette = InspirationalPalette(
    palette: Palette(
        name: "WaterFall",
        colors: [
            UIColor.systemTeal,
            UIColor.systemGreen,
            UIColor.systemMint,
            UIColor.systemYellow,
            UIColor.systemBrown,
        ]),
    imageName: "waterfall"
)

private let tropicalPalette = InspirationalPalette(
    palette: Palette(
        name: "tropical",
        colors: [
            UIColor.systemPurple,
            UIColor.systemGreen,
            UIColor.systemPink,
            UIColor.systemRed,
            UIColor.systemIndigo,
        ]),
    imageName: "waterfall"
)

// Inspirational Palette Collection 1
private let foodPalettes = InspirationalPaletteCollection(
    name: "Food",
    palettes: [
        ramenPalette,
        greekSaladPalette,
        pinaColadaPalette,
        carrotCakePalette
    ]
)

// Inspirational Palette Collection 2
private let naturePalettes = InspirationalPaletteCollection(
    name: "Nature",
    palettes: [
        waterFallPalette,
        tropicalPalette
    ]
)




