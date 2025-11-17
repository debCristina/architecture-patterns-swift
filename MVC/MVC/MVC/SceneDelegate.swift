//
//  SceneDelegate.swift
//  MVC
//
//  Created by Débora Cristina Silva Ferreira on 12/11/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let rootVC = TaskListViewController()
        let navController = UINavigationController(rootViewController: rootVC)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }



}

