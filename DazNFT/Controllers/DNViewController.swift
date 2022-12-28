//
//  DNViewController.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

class DNViewController: UIViewController {
    let topCircle = GlowBall()
    let bottomCircle = GlowBall()
    let phoneHeight = UIScreen.main.bounds.height
    let phoneWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .light {
            view.addSubview(topCircle)
            view.addSubview(bottomCircle)
        }
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topCircle.frame = .init(x: phoneWidth * 0.05,
                                y: -300,
                                width: phoneHeight,
                                height: phoneHeight)
        
        bottomCircle.frame = .init(x: -300,
                                   y: phoneHeight * 0.47,
                                   width: phoneHeight,
                                   height: phoneHeight)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.userInterfaceStyle == .dark {
            topCircle.removeFromSuperview()
            bottomCircle.removeFromSuperview()
        } else {
            view.addSubview(topCircle)
            view.addSubview(bottomCircle)
            view.sendSubviewToBack(topCircle)
            view.sendSubviewToBack(bottomCircle)
        }
    }
}
