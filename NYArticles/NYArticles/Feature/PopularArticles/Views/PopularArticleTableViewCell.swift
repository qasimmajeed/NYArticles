//
//  PopularArticleTableViewCell.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Kingfisher
import UIKit

final class PopularArticleTableViewCell: UITableViewCell {
    // MARK: - Properties

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var byLineLabel: UILabel!
    @IBOutlet private var sectionTitleLabel: UILabel!
    @IBOutlet private var publishedDataLabel: UILabel!
    @IBOutlet private var articleImageView: UIImageView!

    var viewModel: PopularArticleCellViewModel? {
        didSet {
            if let viewModel = viewModel {
                titleLabel.text = viewModel.title
                byLineLabel.text = viewModel.byLineText
                sectionTitleLabel.text = viewModel.sectionTitle
                publishedDataLabel.text = viewModel.publishedDate
                articleImageView.kf.setImage(with: viewModel.articleImageUrl)
            }
        }
    }

    // MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    private func configureUI() {
        articleImageView.layer.cornerRadius = articleImageView.bounds.size.height / 2
    }
}
