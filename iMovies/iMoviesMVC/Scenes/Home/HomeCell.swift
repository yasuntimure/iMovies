//
//  HomeTableViewCell.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import Foundation
import UIKit
import Combine
import iMoviesAPI

class HomeCell: UITableViewCell, ViewProtocol, Reuseable {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var movie: Result?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ThemeManager.Font.Medium.font(size: .mediumlarge)
        label.numberOfLines = 0
        return label
    }()

    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ThemeManager.Font.Roman.font(size: .smallmedium)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureContents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        [titleLabel, detailLabel].forEach { contentView.addSubview($0) } 
    }

    func registerObservers() {
        $movie.sink { model in
            self.titleLabel.text = model?.displayTitle
            self.detailLabel.text = model?.mpaaRating
        }.store(in: &subscribers)
    }

    func setConstraints() {
        [contentView, titleLabel, detailLabel]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

}
