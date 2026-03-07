//
//  SceneDelegate.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Создаем окно
        let window = UIWindow(windowScene: windowScene)
        
        // Создаем навигационный контроллер
        let navigationController = UINavigationController()
        
        // Создаем роутер
        let router = AppRouter(navigationController: navigationController)
        self.appRouter = router
        
        // Запускаем первый экран
        router.start()
        
        // Настраиваем окно
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
