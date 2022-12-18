//
//  HomeView.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit
import Combine

final class HomeView: UIView, ViewProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published public var viewModel: [MoviePresentation] = []
    @Published public var isLoading: Bool?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        registerObservers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(tableView)
    }

    func configureView(_ viewModel: [MoviePresentation]?) { }

    func registerObservers() {
        $viewModel.sink { model in
            self.configureView(model)
        }.store(in: &subscribers)

        $isLoading.sink { isLoading in
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }.store(in: &subscribers)
    }

    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}


// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>)
    }

}


// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

}
