//
//  NetworkError.swift
//
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation

/// NetworkError have the information regarding the Network errors
public enum NetworkError: Error, Equatable {
    case invalidRequest
    case inValidResponse
    case inValidHTTPResponse(code: Int)
    case invalidURL
}
