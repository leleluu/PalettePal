import Foundation
import UIKit

struct DummyData {
    
    static let inspirationalPaletteCollections: [InspirationalPaletteCollection] = [
        cityPalettes,
        foodPalettes,
        animalPalettes
    ]
    
}

// Individual City Color Palettes

private let lisbonPalette = InspirationalPalette(
    palette: Palette(
        name: "Lisbon",
        colors: [
            UIColor.init(rgb: [214, 184, 117]),
            UIColor.init(rgb: [192, 120, 79]),
            UIColor.init(rgb: [236, 192, 167]),
            UIColor.init(rgb: [2, 89, 130]),
            UIColor.init(rgb: [8, 48, 48]),
        ]),
    imageName: "lisbon"
)

private let chefchaouenPalette = InspirationalPalette(
    palette: Palette(
        name: "Chefchaouen",
        colors: [
            UIColor.init(rgb: [214, 240, 241]),
            UIColor.init(rgb: [79, 168, 203]),
            UIColor.init(rgb: [1, 93, 173]),
            UIColor.init(rgb: [187, 234, 239]),
            UIColor.init(rgb: [0, 55, 112]),
        ]),
    imageName: "chefchaouen"
)

private let copenhagenPalette = InspirationalPalette(
    palette: Palette(
        name: "Copenhagen",
        colors: [
            UIColor.init(rgb: [249, 247, 248]),
            UIColor.init(rgb: [231, 197, 123]),
            UIColor.init(rgb: [220, 111, 48]),
            UIColor.init(rgb: [83, 140, 167]),
            UIColor.init(rgb: [164, 57, 41]),
        ]),
    imageName: "copenhagen"
)

// Individual Food Color Palettes
private let avocadoToastPalette = InspirationalPalette(
    palette: Palette(
        name: "Avocado Toast",
        colors: [
            UIColor.init(rgb: [159, 101, 53]),
            UIColor.init(rgb: [128, 170, 88]),
            UIColor.init(rgb: [201, 208, 124]),
            UIColor.init(rgb: [232, 225, 204]),
            UIColor.init(rgb: [149, 114, 74]),
        ]),
    imageName: "avocadotoast"
)

private let grapefruitPalette = InspirationalPalette(
    palette: Palette(
        name: "Grapefruit",
        colors: [
            UIColor.init(rgb: [135, 34, 28]),
            UIColor.init(rgb: [250, 172, 106]),
            UIColor.init(rgb: [230, 63, 39]),
            UIColor.init(rgb: [249, 170, 65]),
            UIColor.init(rgb: [232, 131, 140]),
        ]),
    imageName: "grapefruit"
)

private let strawberriesAndCreamPalette = InspirationalPalette(
    palette: Palette(
        name: "Strawberries and Cream",
        colors: [
            UIColor.init(rgb: [198, 17, 15]),
            UIColor.init(rgb: [252, 111, 87]),
            UIColor.init(rgb: [241, 227, 222]),
            UIColor.init(rgb: [243, 184, 176]),
            UIColor.init(rgb: [253, 252, 251]),
        ]),
    imageName: "strawberrycupcakes"
)

private let cappuccinoPalette = InspirationalPalette(
    palette: Palette(
        name: "Cappuccino Delight",
        colors: [
            UIColor.init(rgb: [220, 221, 223]),
            UIColor.init(rgb: [221, 195, 174]),
            UIColor.init(rgb: [130, 64, 29]),
            UIColor.init(rgb: [168, 107, 63]),
            UIColor.init(rgb: [56, 36, 25]),
        ]),
    imageName: "cappuccino"
)

// Individual Nature Color Palettes

private let kingfisherPalette = InspirationalPalette(
    palette: Palette(
        name: "Kingfisher",
        colors: [
            UIColor.init(rgb: [180, 111, 54]),
            UIColor.init(rgb: [210, 177, 139]),
            UIColor.init(rgb: [76, 61, 58]),
            UIColor.init(rgb: [12, 93, 94]),
            UIColor.init(rgb: [80, 179, 195]),
        ]),
    imageName: "kingfisher"
)

private let penguinPalette = InspirationalPalette(
    palette: Palette(
        name: "Penguin",
        colors: [
            UIColor.init(rgb: [228, 227, 225]),
            UIColor.init(rgb: [13, 18, 22]),
            UIColor.init(rgb: [114, 116, 113]),
            UIColor.init(rgb: [237, 145, 0]),
            UIColor.init(rgb: [242, 228, 183]),
        ]),
    imageName: "penguin"
)

private let giraffePalette = InspirationalPalette(
    palette: Palette(
        name: "Giraffe",
        colors: [
            UIColor.init(rgb: [217, 152, 86]),
            UIColor.init(rgb: [80, 57, 33]),
            UIColor.init(rgb: [208, 171, 120]),
            UIColor.init(rgb: [234, 230, 218]),
            UIColor.init(rgb: [95, 108, 55]),
        ]),
    imageName: "giraffe"
)
// Cities Palette Collection 1

private let cityPalettes = InspirationalPaletteCollection(
    name: "Colorful cities",
    palettes: [
        lisbonPalette,
        chefchaouenPalette,
        copenhagenPalette,
    ]
)

// Food Palette Collection
private let foodPalettes = InspirationalPaletteCollection(
    name: "Food-inspired palettes",
    palettes: [
        grapefruitPalette,
        avocadoToastPalette,
        strawberriesAndCreamPalette,
        cappuccinoPalette
    ]
)

// Animal Palette Collection
private let animalPalettes = InspirationalPaletteCollection(
    name: "Animal patterns",
    palettes: [
        kingfisherPalette,
        penguinPalette,
        giraffePalette
    ]
)




