//
//  DazButton.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

extension UIButton {
    func applyGradient(colors: [CGColor], cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(UIColor.white, for: .normal)    }
}

class DazButton: UIButton {
    static func makeButton() -> UIButton {
        let button = UIButton(type: .system)
        
        
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.Heading.text5_3
        button.layer.cornerRadius = 20
        
        return button
    }
}
