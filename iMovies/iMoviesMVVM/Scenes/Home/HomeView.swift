//
//  HomeView.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit
import Combine

final class HomeView: UIView, ViewProtocol {

    var onCellSelect: ((_ movie: MoviePresentation) -> Void)?

    private var subscribers = Set<AnyCancellable>()

    var viewModel: String?

    @Published public var movies: MoviePresentations = []
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
        self.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: HomeCell.self)

        addSubview(tableView)
    }

    func registerObservers() {
        $movies
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            self.tableView.reloadData()
        }.store(in: &subscribers)

        $isLoading.sink { isLoading in
           //
        }.store(in: &subscribers)
    }

    func configureView(_ viewModel: String?) { }

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
        cell.viewModel = movies[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onCellSelect?(movies[indexPath.row])
    }
}


// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

}

