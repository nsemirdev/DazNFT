//
//  Colors.swift
//  DazNFT
//
//  Created by Emir Alkal on 27.12.2022.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

struct Colors {
    
    struct Primary {
        static let deepPurple = UIColor(hex: "#5F61F0FF")
        static let dark = UIColor(hex: "#4C4EC0FF")
        static let darker = UIColor(hex: "#393B3EFF")
        static let darkest = UIColor(hex: "#131330FF")
        static let light = UIColor(hex: "#7f81f3FF")
        static let lighter = UIColor(hex: "#9fa0f6FF")
        static let lightest = UIColor(hex: "#dfdffcFF")
    }
    
    struct Secondary {
        static let dark = UIColor(hex: "#FFD14BFF")
        static let darker = UIColor(hex: "#cca73cff")
        static let darkest = UIColor(hex: "#66541eff")
        static let light = UIColor(hex: "#ffda6fff")
        static let lighter = UIColor(hex: "#ffe393ff")
        static let lightest = UIColor(hex: "#fff6dbff")
    }
    
    struct Text {
        static let highEmp = UIColor(hex: "#454459ff")
        static let mediumEmp = UIColor(hex: "#616161ff")
        static let lowEmp = UIColor(hex: "#757575ff")
        static let allDisabled = UIColor(hex: "#c4c4c4ff")
        static let last = UIColor(hex: "#9999A7ff")
    }
    
    
    struct Gradient {
        static let start = UIColor(hex: "#D7D3FFFF")!
        static let end = UIColor(hex: "#D3E4FF00")!
    }
    
    struct PurpleGradient {
        static let start = UIColor(hex: "#A49BFEFF")!
        static let end = UIColor(hex: "#7173EBFF")!
    }
}
