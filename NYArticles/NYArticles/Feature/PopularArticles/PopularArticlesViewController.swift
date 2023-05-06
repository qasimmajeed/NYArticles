//
//  PopularArticlesViewController.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

final class PopularArticlesViewController: UIViewController {
    // MARK: - Properties

    private let viewModel: PopularArticlesViewModel

    // MARK: - Init

    init?(coder: NSCoder, viewModel: PopularArticlesViewModel = PopularArticlesViewModel()) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("viewModel(PopularArticlesViewModel) must provided while initialisation")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.fetchArticles()
    }

    // MARK: - Private Methods

    private func configureUI() {
        title = viewModel.title
    }
}
