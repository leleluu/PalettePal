import UIKit

extension UIColor {
    
    // MARK: - Initialization
    
    convenience init(rgb:[Int]) {
        let convertedValues = rgb.map { value in
            CGFloat(value) / 255.0
        }
        self.init(red: convertedValues[0], green: convertedValues[1], blue: convertedValues[2], alpha: 1)
    }
    
    // MARK: - Computed Properties
    
    var rgbString: String {
        let red = Int(self.cgColor.components![0] * 255)
        let green = Int(self.cgColor.components![1] * 255)
        let blue = Int(self.cgColor.components![2] * 255)
        
        return("Red: \(red), Green: \(green), Blue: \(blue)")
    }
    
    
    var hexString: String {
        let red = Int(self.cgColor.components![0] * 255)
        let green = Int(self.cgColor.components![1] * 255)
        let blue = Int(self.cgColor.components![2] * 255)

        return String(format: "%02lX%02lX%02lX", red, green, blue)

    }
}
