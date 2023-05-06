//
//  FamousArticlesResponse.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

struct FamousArticlesResponse: Decodable {
    let results: [Article]
}
