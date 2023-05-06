//
//  PopularArticlesViewModelTestCases.swift
//  NYArticlesTests
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Combine
@testable import NYArticles
import XCTest

final class PopularArticlesViewModelTestCases: XCTestCase {
    // MARK: - Private Properties

    private var cancellable = Set<AnyCancellable>()
    private var sut: PopularArticlesViewModel!
    private var mockUseCase: ArticleUseCaseMock!
    private var mockNavigator: PopularArticlesViewModelNavigationMock!

    // MARK: - XCTestCase Methods

    override func setUp() {
        super.setUp()
        mockNavigator = PopularArticlesViewModelNavigationMock()
        mockUseCase = ArticleUseCaseMock()
        sut = PopularArticlesViewModel(useCase: mockUseCase, navigator: mockNavigator)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        mockNavigator = nil
        mockUseCase = nil
    }

    // MARK: - Test Cases

    func testPopularArticlesViewModel_WhenLoadTheTitle_ShouldBeSame() {
        // Arrange
        let expectedTitle = "NY Times Most Popular"

        // Assert
        XCTAssertEqual(expectedTitle, sut.title, "The title is not the same as NY Times Most Popular")
    }

    func testPopularArticlesViewModel_WhenFetch_ShouldHaveLoadingState() {
        // Arrange
        var isLoadingState = false
        sut.stateDidUpdate.sink { state in
            if state == .showLoading {
                isLoadingState = true
            }
        }.store(in: &cancellable)

        // Act
        sut.fetchArticles()
        mockUseCase.sendArticle()

        // Assert
        XCTAssertTrue(isLoadingState, "The state should be loading")
    }

    func testPopularArticlesViewModel_WhenSuccess_ShouldHaveData() {
        // Arrange

        var isHavingDataCalled = false

        sut.stateDidUpdate.sink { state in
            if state == .showArticles {
                isHavingDataCalled = true
            }
        }.store(in: &cancellable)

        // Act

        sut.fetchArticles()
        mockUseCase.sendArticle()

        // Assert
        XCTAssertTrue(isHavingDataCalled, "Should called showArticles ")
        XCTAssertTrue(sut.numberOfRows > 0, "Should have data")
    }

    func testPopularArticlesViewModel_WhenError_ShouldShowError() {
        // Arrange
        var isErrorCalled = false

        sut.stateDidUpdate.sink { state in
            guard case .showError = state else { return }
            isErrorCalled = true
        }.store(in: &cancellable)

        // Act
        sut.fetchArticles()
        mockUseCase.sendError()

        // Assert
        XCTAssertTrue(isErrorCalled, "Error should called")
    }

    func testPopularArticlesViewModel_WhenData_ShouldReturnCellViewModel() {
        // Arrange
        var cellViewModel: PopularArticleCellViewModel!
        sut.stateDidUpdate.sink { state in
            if state == .showArticles {
                cellViewModel = self.sut.cellViewModelAtIndex(index: 0)
            }
        }.store(in: &cancellable)

        // Act
        sut.fetchArticles()
        mockUseCase.sendArticle()

        // Assert
        XCTAssertNotNil(cellViewModel, "The cell viewModel should return not nil")
    }

    func testPopularArticlesViewModel_WhenTapOnCell_ShouldOpenDetail() {
        sut.fetchArticles()
        mockUseCase.sendArticle()

        // Act
        sut.didSelectAtIndex(index: 0)

        // Assert
        XCTAssertTrue(mockNavigator.showArticleDetailDidCall, "The cell viewModel should return not nil")
    }
}
