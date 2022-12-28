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
        topCircle.frame = .init(x: 48, y: -356, width: 738, height: 738)
        bottomCircle.frame = .init(x: -281, y: 370, width: 738, height: 738)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.userInterfaceStyle == .dark {
            topCircle.removeFromSuperview()
            bottomCircle.removeFromSuperview()
        } else {
            view.addSubview(topCircle)
            view.addSubview(bottomCircle)
        }
    }
}
