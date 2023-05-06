//
//  PopularArticlesViewModel.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Combine

/// State for the ViewModel
enum PopularArticlesViewModelViewState {
    case showLoading
    case hideLoading
    case showArticles
    case showError(title: String, message: String)
}

final class PopularArticlesViewModel {
    // MARK: - Private Properties

    private let useCase: ArticleUseCaseProtocol
    private let stateDidUpdateSubject = PassthroughSubject<PopularArticlesViewModelViewState, Never>()
    private var cancellable: Set<AnyCancellable> = .init()
    private var articles: [Article] = .init()

    // MARK: - Properties

    private(set) lazy var stateDidUpdate: AnyPublisher<PopularArticlesViewModelViewState, Never> = stateDidUpdateSubject.eraseToAnyPublisher()

    var title: String {
        return "NY Times Most Popular"
    }

    var numberOfSections: Int {
        return 1
    }

    var numberOfRows: Int {
        return articles.count
    }

    // MARK: - init

    init(useCase: ArticleUseCaseProtocol = ArticleUseCase()) {
        self.useCase = useCase
    }

    // MARK: - Methods

    func fetchArticles() {
        stateDidUpdateSubject.send(.showLoading)
        useCase.fetchPopularArticles(request: PopularArticlesRequest(apiKey: Constants.apiKey))
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure:
                    self.stateDidUpdateSubject.send(.showError(title: "Error", message: "Unexpected Error happened!"))
                default:
                    self.stateDidUpdateSubject.send(.hideLoading)
                }
            } receiveValue: { [weak self] articles in
                guard let self = self else { return }
                self.articles = articles
                self.stateDidUpdateSubject.send(.showArticles)
            }.store(in: &cancellable)
    }
}
