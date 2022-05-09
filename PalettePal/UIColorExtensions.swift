import UIKit

extension UIColor {
    convenience init(rgb:[Int]) {
        let convertedValues = rgb.map { value in
            CGFloat(value) / 255.0
        }
        self.init(red: convertedValues[0], green: convertedValues[1], blue: convertedValues[2], alpha: 1)
    }
}
