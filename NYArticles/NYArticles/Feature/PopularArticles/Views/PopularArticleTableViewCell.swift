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

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var byLineLabel: UILabel!
    @IBOutlet var sectionTitleLabel: UILabel!
    @IBOutlet var publishedDataLabel: UILabel!
    @IBOutlet var articleImageView: UIImageView!

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

    override func layoutSubviews() {
        super.layoutSubviews()
        articleImageView.layer.cornerRadius = articleImageView.bounds.size.height / 2
    }
}
