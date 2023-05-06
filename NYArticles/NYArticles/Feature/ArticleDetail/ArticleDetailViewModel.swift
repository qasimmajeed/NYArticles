//
//  ArticleDetailViewModel.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

struct ArticleDetailViewModel {
    // MARK: - Private Properties

    private let article: Article

    // MARK: - Properties

    var title: String
    let byLineText: String
    let sectionTitle: String
    let publishedDate: String

    // MARK: - init

    init(article: Article) {
        self.article = article
        title = article.title
        byLineText = article.byLine
        sectionTitle = article.section
        publishedDate = article.publishedDate
    }
}
