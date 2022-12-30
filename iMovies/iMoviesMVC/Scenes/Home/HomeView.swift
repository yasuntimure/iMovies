//
//  HomeView.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit
import Combine
import iMoviesAPI

final class HomeView: UIView, ViewProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published public var movies: [MoviePresentation] = []
    @Published public var isLoading: Bool = false

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: HomeCell.self)

        addSubview(tableView)
    }

    func registerObservers() {
        $movies
            .receive(on: DispatchQueue.main)
            .sink { _ in
            self.tableView.reloadData()
        }.store(in: &subscribers)

        $isLoading.sink { isLoading in
           //
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as HomeCell
        cell.movie = movies[indexPath.row]
        return cell
    }

}


// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

}
