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
    private let tableViewDelegate: PopularArticlesTableDataSourceDelegateProtocol
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicatorView: UIActivityIndicatorView!
    private var cancellable = Set<AnyCancellable>()
    private lazy var pullToRefresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: viewModel.refreshTitle)
        return refresh
    }()

    // MARK: - Init

    init?(coder: NSCoder, viewModel: PopularArticlesViewModel, tableViewDelegate: PopularArticlesTableDataSourceDelegateProtocol) {
        self.viewModel = viewModel
        self.tableViewDelegate = tableViewDelegate
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
        tableView.addSubview(pullToRefresh)
        pullToRefresh.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
    }

    private func binding() {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                    guard let self = self else { return }
                    self.pullToRefresh.endRefreshing()
                }
            case .showArticles:
                self.tableView.reloadData()
            }
        }
    }

    @objc func pullToRefreshAction() {
        viewModel.fetchArticles()
    }
}
