//
//  PopularArticlesViewController.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Combine
import UIKit

final class PopularArticlesViewController: UIViewController {
    // MARK: - Properties

    private let viewModel: PopularArticlesViewModel
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingIndicatorView: UIActivityIndicatorView!
    private var cancellable = Set<AnyCancellable>()
    private lazy var pullToRefresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: viewModel.refreshTitle)
        return refresh
    }()

    // MARK: - Init

    init?(coder: NSCoder, viewModel: PopularArticlesViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("viewModel(PopularArticlesViewModel) must provided while initialisation")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        binding()
        viewModel.fetchArticles()
    }

    // MARK: - Private Methods

    private func configureUI() {
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.addSubview(pullToRefresh)
        pullToRefresh.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
    }

    private func binding() {
        viewModel.stateDidUpdate.sink { [weak self] state in
            guard let self = self else { return }
            self.updateState(state: state)
        }.store(in: &cancellable)
    }

    private func updateState(state: PopularArticlesViewModelViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch state {
            case let .showError(title, message):
                self.showAlert(title: title, message: message)
            case .showLoading:
                self.loadingIndicatorView.startAnimating()
                self.loadingIndicatorView.isHidden = false
            case .hideLoading:
                self.loadingIndicatorView.stopAnimating()
                self.loadingIndicatorView.isHidden = true
                self.pullToRefresh.endRefreshing()
            case .showArticles:
                self.tableView.reloadData()
            }
        }
    }

    @objc func pullToRefreshAction() {
        viewModel.fetchArticles()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension PopularArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularArticleTableViewCell.reuseAbleCellIdentifier) as? PopularArticleTableViewCell else {
            return UITableViewCell()
        }
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
