//
//  ViewController.swift
//  DazNFT
//
//  Created by Emir Alkal on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame = view.bounds
    }

}

