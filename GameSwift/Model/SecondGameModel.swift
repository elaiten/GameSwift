//
//  SecondGameModel.swift
//  GameSwift
//
//  Created by Руслан on 8.12.2023.
//

import Foundation
import UIKit

class SecondGameModel: GeneratorProtocol {
        
    var chooseColorOne: String = ""
    var chooseColorSecond: String = ""
    var chooseColorThree: String = ""
    var chooseColorFours: String = ""
    
    var random: String! = ""
    init?() {
        random = generateRandomColor()
    }

        func randomCharacter() -> String? {
          let numbers = [0,1,2,3,4,5,6, 7, 8, 9]
          let letters = ["A","B","C","D","E","F"]
          
          let numberOrLetter = arc4random_uniform(2)
          
          switch numberOrLetter {
            case 0: return String(numbers[Int(arc4random_uniform(10))])
            case 1: return letters[Int(arc4random_uniform(6))]
            default: return nil
          }
        }

        /* Translate a character array of a color to a string
         representing a HEX*/
        func characterArrayToHexString(array: [String]) -> String {
          var hexString = ""
          for character in array {
            hexString += character
          }
          return hexString
        }

        // Generate a random color in HEX
        func generateRandomColor() -> String {
          var characterArray: [String] = []
          for _ in 0...5 {
            characterArray.append(randomCharacter()!)
          }
          return characterArrayToHexString(array: characterArray)
        }


    
    func getNewSecretValue() -> Int {
        (1...4).randomElement()!
    }
    

    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
