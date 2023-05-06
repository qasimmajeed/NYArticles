//
//  ArticleUseCase.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Combine
import Foundation
import NetworkFeature

protocol ArticleUseCaseProtocol {
    // This will the get popular articles by given `request`.
    /// - Parameters
    ///     - request:  The provided request.
    /// - Returns  AnyPublisher: with the articles or in the case of error
    func fetchPopularArticles(request: PopularArticlesRequest) -> AnyPublisher<[Article], NetworkError>
}

struct ArticleUseCase: ArticleUseCaseProtocol {
    // MARK: - Private Properties

    private let network: Networking

    // MARK: - init

    init(network: Networking = Network(urlSession: URLSession.shared)) {
        self.network = network
    }

    // MARK: - ArticleUseCaseProtocol

    func fetchPopularArticles(request: PopularArticlesRequest) -> AnyPublisher<[Article], NetworkError> {
        var queryParameters = [String: String]()
        queryParameters["api-key"] = request.apiKey
        let requestBuilder = ApiRequestBuilder(scheme: "https",
                                               host: Constants.APIUrls.baseURL,
                                               path: Constants.APIPaths.famousArticles, httpMethod: .Get,
                                               queryParameters: queryParameters)
        return network.request(request: requestBuilder)
            .mapError { $0 }
            .map { ($0 as FamousArticlesResponse).results }
            .eraseToAnyPublisher()
    }
}
