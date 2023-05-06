//
//  ArticleDetailViewController.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

final class ArticleDetailViewController: UIViewController {
    // MARK: - Properties

    private let viewModel: ArticleDetailViewModel

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var byLineLabel: UILabel!
    @IBOutlet var sectionTitleLabel: UILabel!
    @IBOutlet var publishedDataLabel: UILabel!

    // MARK: - Init

    init?(coder: NSCoder, viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("viewModel(ArticleDetailViewModel) must provided while initialisation")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        binding()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func binding() {
        titleLabel.text = viewModel.title
        byLineLabel.text = viewModel.byLineText
        sectionTitleLabel.text = viewModel.sectionTitle
        publishedDataLabel.text = viewModel.publishedDate
    }
}
