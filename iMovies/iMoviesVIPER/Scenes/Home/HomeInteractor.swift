//
//  HomeInteractor.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import iMoviesAPI

final class HomeInteractor: HomeInteractorProtocol {

    var delegate: HomeInteractorDelegate?

    internal var movies: [Movie] = []

    internal var service: WebServiceProtocol

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
        let moviePresentation = movie.map()
        self.delegate?.handleOutput(.showMovieDetail(moviePresentation))
    }
}
