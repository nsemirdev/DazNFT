//
//  GlowBall.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

class GlowBall: UIView {
    private lazy var pulse: CAGradientLayer = {
        let l = CAGradientLayer()
        l.type = .radial
        l.colors = [Colors.Gradient.start.cgColor, Colors.Gradient.end.cgColor]
        l.locations = [0, 1]
        l.startPoint = CGPoint(x: 0.5, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(l)
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pulse.frame = bounds
        pulse.cornerRadius = bounds.width / 2
    }
}
