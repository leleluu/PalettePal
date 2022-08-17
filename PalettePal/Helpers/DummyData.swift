import Foundation
import UIKit

struct DummyData {
    
    static let inspirationalPaletteCollections: [InspirationalPaletteCollection] = [
        placesPalettes,
        foodPalettes,
        animalPalettes
    ]
    
}

// Place Color Palettes

private let buranoPalette = InspirationalPalette(
    palette: Palette(
        name: "Burano",
        colors: [
            UIColor.init(rgb: [248, 175, 183]),
            UIColor.init(rgb: [245, 114, 129]),
            UIColor.init(rgb: [247, 186, 6]),
            UIColor.init(rgb: [207, 82, 16]),
            UIColor.init(rgb: [29, 80, 197]),
        ]),
    imageName: "burano"
)

private let provencePalette = InspirationalPalette(
    palette: Palette(
        name: "Provence",
        colors: [
            UIColor.init(rgb: [247, 209, 222]),
            UIColor.init(rgb: [198, 164, 201]),
            UIColor.init(rgb: [117, 72, 175]),
            UIColor.init(rgb: [141, 92, 173]),
            UIColor.init(rgb: [126, 139, 127]),
        ]),
    imageName: "provence"
)

private let banffPalette = InspirationalPalette(
    palette: Palette(
        name: "Banff",
        colors: [
            UIColor.init(rgb: [68, 145, 183]),
            UIColor.init(rgb: [214, 238, 251]),
            UIColor.init(rgb: [196, 165, 88]),
            UIColor.init(rgb: [52, 85, 50]),
            UIColor.init(rgb: [25, 58, 28]),
        ]),
    imageName: "banff"
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

// Food Color Palettes

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
        name: "Capuccino",
        colors: [
            UIColor.init(rgb: [220, 221, 223]),
            UIColor.init(rgb: [221, 195, 174]),
            UIColor.init(rgb: [130, 64, 29]),
            UIColor.init(rgb: [168, 107, 63]),
            UIColor.init(rgb: [56, 36, 25]),
        ]),
    imageName: "cappuccino"
)

private let sushiPalette = InspirationalPalette(
    palette: Palette(
        name: "Sushi",
        colors: [
            UIColor.init(rgb: [248, 239, 222]),
            UIColor.init(rgb: [254, 155, 27]),
            UIColor.init(rgb: [255, 206, 151]),
            UIColor.init(rgb: [180, 177, 44]),
            UIColor.init(rgb: [52, 35, 22]),
        ]),
    imageName: "sushi"
)

// Animal Color Palettes

private let toucanPalette = InspirationalPalette(
    palette: Palette(
        name: "Toucan",
        colors: [
            UIColor.init(rgb: [239, 208, 7]),
            UIColor.init(rgb: [60, 84, 11]),
            UIColor.init(rgb: [226, 135, 137]),
            UIColor.init(rgb: [190, 212, 28]),
            UIColor.init(rgb: [226, 108, 7]),
        ]),
    imageName: "toucan"
)

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

private let clownfishPalette = InspirationalPalette(
    palette: Palette(
        name: "Clownfish",
        colors: [
            UIColor.init(rgb: [209, 86, 7]),
            UIColor.init(rgb: [235, 144, 11]),
            UIColor.init(rgb: [254, 252, 254]),
            UIColor.init(rgb: [113, 34, 131]),
            UIColor.init(rgb: [173, 88, 160]),
        ]),
    imageName: "clownfish"
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

// Places Palette Collection

private let placesPalettes = InspirationalPaletteCollection(
    name: "Places",
    palettes: [
        buranoPalette,
        banffPalette,
        provencePalette,
        chefchaouenPalette,
        copenhagenPalette,
    ]
)

// Food Palette Collection
private let foodPalettes = InspirationalPaletteCollection(
    name: "Food",
    palettes: [
        grapefruitPalette,
        avocadoToastPalette,
        strawberriesAndCreamPalette,
        cappuccinoPalette,
        sushiPalette
    ]
)

// Animal Palette Collection
private let animalPalettes = InspirationalPaletteCollection(
    name: "Animals",
    palettes: [
        toucanPalette,
        kingfisherPalette,
        clownfishPalette,
        penguinPalette,
        giraffePalette,
    ]
)




