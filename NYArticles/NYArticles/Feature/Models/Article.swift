//
//  Article.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

struct Article: Decodable {
    let id: Int
    let title: String
    let abstract: String
    let publishedDate: String
    let byLine: String
    let section: String
    var media: [Media]?

    enum CodingKeys: String, CodingKey {
        case id, title, abstract, section, media
        case publishedDate = "published_date"
        case byLine = "byline"
    }
}
