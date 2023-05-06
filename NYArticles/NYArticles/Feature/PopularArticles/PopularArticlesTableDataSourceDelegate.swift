//
//  PopularArticlesTableDataSourceDelegate.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 07/05/2023.
//

import UIKit

protocol PopularArticlesTableDataSourceDelegateProtocol: AnyObject, UITableViewDelegate, UITableViewDataSource {
    var viewModel: PopularArticlesViewModel { get set }
}

final class PopularArticlesTableDataSourceDelegate: NSObject, PopularArticlesTableDataSourceDelegateProtocol {
    // MARK: - Properties

    var viewModel: PopularArticlesViewModel

    // MARK: - init

    init(viewModel: PopularArticlesViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - PopularArticlesTableDataSourceDelegateProtocol

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PopularArticleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.cellViewModelAtIndex(index: indexPath.row)
        return cell
    }

    func numberOfSections(in _: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectAtIndex(index: indexPath.row)
    }
}
