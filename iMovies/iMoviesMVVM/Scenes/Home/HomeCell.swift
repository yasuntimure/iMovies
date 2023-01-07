//
//  HomeCell.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Foundation
import UIKit
import Combine
import Kingfisher
import iMoviesAPI

class HomeCell: UITableViewCell, ViewProtocol, Reuseable {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewModel: MoviePresentation?

    lazy var thumbImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.Medium.font(size: .mediumlarge)
        label.numberOfLines = 1

        return label
    }()

    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.Roman.font(size: .smallmedium)
        label.numberOfLines = 3
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
        [thumbImage, titleLabel, detailLabel].forEach { contentView.addSubview($0) }
    }

    func registerObservers() {
        $viewModel.sink { model in
            self.configureView(model)
        }.store(in: &subscribers)
    }

    func configureView(_ viewModel: MoviePresentation?) {
        self.titleLabel.text = viewModel?.title
        self.detailLabel.text = viewModel?.summary
        self.thumbImage.setKfImage(for: viewModel?.imageUrl)
    }

    func setConstraints() {
        [contentView, thumbImage, titleLabel, detailLabel]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            thumbImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            thumbImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            thumbImage.heightAnchor.constraint(equalToConstant: 85),
            thumbImage.widthAnchor.constraint(equalToConstant: 100),

            titleLabel.topAnchor.constraint(equalTo: thumbImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}


