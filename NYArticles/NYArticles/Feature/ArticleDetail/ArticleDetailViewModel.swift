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

    let title: String
    let detail: String
    let byLineText: String
    let sectionTitle: String
    let publishedDate: String

    // MARK: - init

    init(article: Article) {
        self.article = article
        title = article.title
        detail = article.abstract
        byLineText = article.byLine
        sectionTitle = article.section
        publishedDate = article.publishedDate
    }
}
