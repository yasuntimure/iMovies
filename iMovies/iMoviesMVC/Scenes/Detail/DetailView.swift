//
//  DetailView.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 30.12.2022.
//

import UIKit
import Combine
import iMoviesAPI

final class DetailView: UIView, ViewProtocol, UIScrollViewDelegate {

    private var subscribers = Set<AnyCancellable>()

    @Published public var movie: MoviePresentation?
    @Published public var isLoading: Bool = false

    lazy var headerView: HeaderView = {
        let view = HeaderView()
        return view
    }()

    lazy var bodyView: BodyView = {
        let view = BodyView()
        return view
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
        addSubview(headerView)
        addSubview(bodyView)
    }

    func registerObservers() {
        $movie.sink { data in
            self.headerView.movie = data
            self.bodyView.summary = data?.summary
        }.store(in: &subscribers)
    }

    func setConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),

            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}


final class HeaderView: UIView, ViewProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published public var movie: MoviePresentation?

    lazy var thumbImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.alpha = 0.7
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeManager.Font.Black.font(size: .xlarge)
        label.textColor = .white
        label.numberOfLines = 0
        return label
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
        self.backgroundColor = .black
        [thumbImage, titleLabel].forEach({ addSubview($0) })
    }

    func registerObservers() {
        $movie.sink { data in
            self.titleLabel.text = data?.title
            self.thumbImage.setKfImage(for: data?.imageUrl)
        }.store(in: &subscribers)

    }

    func setConstraints() {
        [thumbImage, titleLabel].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })

        NSLayoutConstraint.activate([
            thumbImage.topAnchor.constraint(equalTo: topAnchor),
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: thumbImage.bottomAnchor, constant: -5)
        ])
    }

}

final class BodyView: UIView, ViewProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published public var summary: String?

    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeManager.Font.Book.font(size: .medium)
        label.numberOfLines = 0
        return label
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
        addSubview(summaryLabel)
    }

    func registerObservers() {
        $summary.sink { summary in
            self.summaryLabel.text = summary
        }.store(in: &subscribers)

    }

    func setConstraints() {
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            summaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            summaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }

}

