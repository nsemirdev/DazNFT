//
//  UIApplication.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}
