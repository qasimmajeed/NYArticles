//
//  PopularArticlesCoordinator.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

protocol PopularArticlesCoordinatorProtocol: Coordinator {}

struct PopularArticlesCoordinator: PopularArticlesCoordinatorProtocol {
    // MARK: - Private Properties

    private let navigationController: UINavigationController

    // MARK: - init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator Implementation

    func start() {
        let storyboard = UIStoryboard(name: .articles, bundle: Bundle.main)
        let viewModel = PopularArticlesViewModel(navigator: self)
        let tableViewDelegate = PopularArticlesTableDataSourceDelegate(viewModel: viewModel)
        let famousArticlesViewController = storyboard.instantiateViewController(identifier: "PopularArticlesViewController") {
            PopularArticlesViewController(coder: $0, viewModel: viewModel, tableViewDelegate: tableViewDelegate)
        }
        navigationController.setViewControllers([famousArticlesViewController], animated: true)
    }
}

// MARK: - PopularArticlesViewModelNavigation

extension PopularArticlesCoordinator: PopularArticlesViewModelNavigation {
    func showArticleDetail(_ article: Article) {
        let storyboard = UIStoryboard(name: .articles, bundle: Bundle.main)
        let detailViewController = storyboard.instantiateViewController(identifier: "ArticleDetailViewController") {
            ArticleDetailViewController(coder: $0, viewModel: ArticleDetailViewModel(article: article))
        }
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
