//
//  HomeInteractor.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import iMoviesAPI

final class HomeInteractor: HomeInteractorProtocol {

    var delegate: HomeInteractorDelegate?

    private let service: WebServiceProtocol
    private var movies: [Movie] = []

    init(service: WebServiceProtocol) {
        self.service = service
    }

    func searchReviews() {
        service.search(movie: "all", completion: { [weak self] (response) in
            guard let response = response else {
                return
            }
            self?.movies = response
            self?.delegate?.handleOutput(.showMovies(response))
        })
    }

    func selectMovie(at index: Int) {
        let movie = movies[index]
        let moviePresentation = MoviePresentation(movie: movie)
        self.delegate?.handleOutput(.showMovieDetail(moviePresentation))
    }
}
