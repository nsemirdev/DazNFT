//
//  MainTabBar.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureTabBar()
    }
    let plusView = UIView()

    fileprivate func configureTabBar() {
        UITabBar.appearance().unselectedItemTintColor = .black

        tabBar.layer.cornerRadius = 20
        tabBar.backgroundColor = .systemBackground
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        plusView.widthAnchor.constraint(equalToConstant: 54).isActive = true
        plusView.backgroundColor = #colorLiteral(red: 0.6431372549, green: 0.6078431373, blue: 0.9960784314, alpha: 1)
        plusView.layer.cornerRadius = 27
        tabBar.addSubview(plusView)

        plusView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(-15)
        }
        tabBar.sendSubviewToBack(plusView)
    }
    
    override func viewDidLayoutSubviews() {
        plusView.applyGradient(colors: [UIColor(hex: "#A49BFEFF")!.cgColor, UIColor(hex: "#7173EBFF")!.cgColor], cornerRadius: 27)
    }
    
    fileprivate func configureViewControllers() {
        let homeNavVC = UINavigationController(rootViewController: HomeVC())
        homeNavVC.tabBarItem.image = #imageLiteral(resourceName: "Group 26")
        homeNavVC.tabBarItem.title = "Home"
        homeNavVC.navigationBar.prefersLargeTitles = true
        
        let searchNavVC = UINavigationController(rootViewController: DNViewController())
        searchNavVC.tabBarItem.image = #imageLiteral(resourceName: "Group 25")
        searchNavVC.tabBarItem.title = "Search"
        
        let plusNavVC = UINavigationController(rootViewController: DNViewController())
        plusNavVC.tabBarItem.image = #imageLiteral(resourceName: "Group 18")
        plusNavVC.tabBarItem.imageInsets = .init(top: -15, left: 0, bottom: 0, right: 0)
        
        let exploreNavVC = UINavigationController(rootViewController: DNViewController())
        exploreNavVC.tabBarItem.image = #imageLiteral(resourceName: "Group 24")
        exploreNavVC.tabBarItem.title = "Explore"
        
        let profileNavVC = UINavigationController(rootViewController: DNViewController())
        profileNavVC.tabBarItem.image = #imageLiteral(resourceName: "Group 27")
        profileNavVC.tabBarItem.title = "Profile"
        
        setViewControllers([
            homeNavVC, searchNavVC, plusNavVC, exploreNavVC, profileNavVC
        ], animated: true)
    }
}
