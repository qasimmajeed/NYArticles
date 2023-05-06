//
//  PopularArticleCellViewModel.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

/// PopularArticleCellViewModel
struct PopularArticleCellViewModel {
    let id: Int
    let title: String
    let byLineText: String
    let articleImageUrl: URL?
    let sectionTitle: String
    let publishedDate: String
}

extension PopularArticleCellViewModel {
    init(article: Article) {
        var articleUrl: URL?
        if let medias = article.media, let media = medias.first, media.type == .image, let data = media.mediaMetaData.first {
            articleUrl = URL(string: data.url)
        }
        self.init(id: article.id,
                  title: article.title,
                  byLineText: article.byLine,
                  articleImageUrl: articleUrl,
                  sectionTitle: article.section,
                  publishedDate: article.publishedDate)
    }
}
