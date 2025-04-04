//
//  SceneDelegate.swift
//  RandomizerApp
//
//  Created by OSIIOSdev on 01.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = RandomizerViewController()
        window?.makeKeyAndVisible()
        
    }
}

