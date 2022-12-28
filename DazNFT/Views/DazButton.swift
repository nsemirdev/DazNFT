//
//  DazButton.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

class DazButton: UIButton {
    static func makeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.Heading.text18_medium
        button.layer.cornerRadius = 20
        return button
    }
}
