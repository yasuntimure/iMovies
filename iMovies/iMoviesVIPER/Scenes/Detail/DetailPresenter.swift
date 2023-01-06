//
//  DetailPresenter.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {

    unowned var view: DetailViewProtocol

    private let moviePresentation: MoviePresentation

    init(
        view: DetailViewProtocol,
        moviePresentation: MoviePresentation
    ) {
        self.view = view
        self.moviePresentation = moviePresentation
    }

    func load() {
        view.update(moviePresentation)
    }
}
