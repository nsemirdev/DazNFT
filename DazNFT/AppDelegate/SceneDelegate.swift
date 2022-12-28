//
//  SceneDelegate.swift
//  DazNFT
//
//  Created by Emir Alkal on 27.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configureAppearance()
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let mainTabBar = MainTabBar()
        mainTabBar.tabBar.unselectedItemTintColor = .black
        mainTabBar.tabBar.tintColor = UIColor(hex: "#A49BFEFF")
        window?.rootViewController = UserDefaults.standard.bool(forKey: "isOnboardingSceneSeen") ? mainTabBar :  OnboardingVC()
    }
    
    func configureAppearance() {
        UINavigationBar.appearance().prefersLargeTitles = true
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        configureAppearance()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        configureAppearance()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        configureAppearance()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        configureAppearance()
    }
}

