//
//  Media.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

enum MediaType: String, Decodable {
    case image
}

struct Media: Decodable {
    let type: MediaType
    var mediaMetaData: [MediaMetaData]

    enum CodingKeys: String, CodingKey {
        case type
        case mediaMetaData = "media-metadata"
    }
}
