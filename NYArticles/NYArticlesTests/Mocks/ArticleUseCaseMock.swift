//
//  ArticleUseCaseMock.swift
//  NYArticlesTests
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Combine
import Foundation
import NetworkFeature
@testable import NYArticles

final class ArticleUseCaseMock: ArticleUseCaseProtocol {
    // MARK: - Private Properties

    private var dataPublisher: PassthroughSubject<[Article], NetworkError> = .init()

    // MARK: - ArticleUseCaseProtocol implementation

    func fetchPopularArticles(request _: PopularArticlesRequest) -> AnyPublisher<[Article], NetworkError> {
        return dataPublisher.eraseToAnyPublisher()
    }

    public func sendArticle() {
        dataPublisher.send(FakeArticleData.fakeData.results)
    }

    public func sendError() {
        let error = NetworkError.inValidResponse
        dataPublisher.send(completion: .failure(error))
    }
}
