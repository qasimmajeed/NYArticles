//
//  NetworkError+Extension.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation
import NetworkFeature

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        if self == .inValidHTTPResponse(code: 401) {
            return "Please update/provide the api key at Constants -> apiKey"

        } else {
            return "Unexpected Error happened!"
        }
    }
}
