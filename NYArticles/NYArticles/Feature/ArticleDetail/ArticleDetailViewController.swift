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

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var detailLabel: UILabel!
    @IBOutlet private var byLineLabel: UILabel!
    @IBOutlet private var sectionTitleLabel: UILabel!
    @IBOutlet private var publishedDataLabel: UILabel!

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
        binding()
    }

    // MARK: - Private Methods

    private func binding() {
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.detail
        byLineLabel.text = viewModel.byLineText
        sectionTitleLabel.text = viewModel.sectionTitle
        publishedDataLabel.text = viewModel.publishedDate
    }
}
