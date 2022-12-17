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

    @Published public var viewModel: String?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()

        $viewModel.sink { model in
            self.configureView(model)
        }.store(in: &subscribers)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setup() {
        addSubview(tableView)
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
