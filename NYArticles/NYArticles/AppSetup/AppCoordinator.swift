//
//  AppCoordinator.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {}

struct AppCoordinator: AppCoordinatorProtocol {
    // MARK: - Private Properties

    private let window: UIWindow
    private let navigation: UINavigationController

    // MARK: - Init

    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigation = navigation
    }

    // MARK: - Coordinator

    func start() {
        let popularArticleCoordinator = PopularArticlesCoordinator(navigationController: navigation)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        popularArticleCoordinator.start()
    }
}
