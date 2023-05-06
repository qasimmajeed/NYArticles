//
//  Constants.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

enum Constants {
    /// Defines all the base api urls
    enum APIUrls {
        static let baseURL = "api.nytimes.com"
    }

    /// Define all the paths for the urls
    enum APIPaths {
        static let famousArticles = "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
    }
}
