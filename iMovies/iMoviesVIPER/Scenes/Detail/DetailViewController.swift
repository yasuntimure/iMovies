//
//  DetailView.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import UIKit
import Combine

final class DetailViewController: UIViewController, DetailViewProtocol {

    internal var presenter: DetailPresenterProtocol?

    lazy var headerView: HeaderView = {
        let view = HeaderView()
        return view
    }()

    lazy var bodyView: BodyView = {
        let view = BodyView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.load()
    }

    func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(bodyView)
        setConstraints()
    }

    func setConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),

            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func update(_ presentation: MoviePresentation) {
        self.headerView.movie = presentation
        self.bodyView.summary = presentation.summary
    }
}


// MARK: - Header View

final class HeaderView: UIView {

    internal var movie: MoviePresentation? {
        didSet {
            self.titleLabel.text = movie?.title
            self.thumbImage.setKfImage(for: movie?.imageUrl)
        }
    }

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
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .black
        [thumbImage, titleLabel].forEach({ addSubview($0) })
        setConstraints()
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


// MARK: - Body View

final class BodyView: UIView {

    internal var summary: String? {
        didSet {
            self.summaryLabel.text = summary
        }
    }

    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeManager.Font.Book.font(size: .medium)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .systemBackground
        addSubview(summaryLabel)
        setConstraints()
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



