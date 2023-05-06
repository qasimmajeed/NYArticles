//
//  PopularArticlesViewModelNavigationMock.swift
//  NYArticlesTests
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation
@testable import NYArticles

final class PopularArticlesViewModelNavigationMock: PopularArticlesViewModelNavigation {
    private(set) var showArticleDetailDidCall = false

    func showArticleDetail(_: Article) {
        showArticleDetailDidCall = true
    }
}
