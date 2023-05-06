//
//  SceneDelegate.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - Private Properties

    /// It will hold the app coordinator to start the flow of application.
    private var coordinator: AppCoordinatorProtocol?

    // MARK: - Methods

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let navigation = UINavigationController()
        let coordinator = AppCoordinator(window: window, navigation: navigation)
        self.window = window
        self.coordinator = coordinator
        coordinator.start()
    }
}
