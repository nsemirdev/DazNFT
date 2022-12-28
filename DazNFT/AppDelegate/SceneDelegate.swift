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
        window?.rootViewController = UserDefaults.standard.bool(forKey: "isOnboardingSceneSeen") ? MainTabBar() :  OnboardingVC()
    }
    
    func configureAppearance() {
        UINavigationBar.appearance().prefersLargeTitles = true
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        configureAppearance()
    }
}

