//
//  HomePresenter.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {

    internal var view: HomeViewProtocol
    internal var router: HomeRouterProtocol
    internal var interactor: HomeInteractorProtocol

    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         router: HomeRouter
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router

        interactor.delegate = self

        view.handleOutput(.updateTitle("Movies"))
    }

    func load() {
        interactor.searchReviews()
    }

    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}


// MARK: - Home Interactor Delegate

extension HomePresenter: HomeInteractorDelegate {

    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .showMovies(let movies):
            let moviePresentations = movies.map({ $0.map() })
            view.handleOutput(.showMovies(moviePresentations))
        case .showMovieDetail(let movie):
            router.navigate(to: .detail(movie))
        }
    }
}
