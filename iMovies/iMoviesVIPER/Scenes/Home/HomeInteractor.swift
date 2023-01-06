//
//  HomeInteractor.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import iMoviesAPI

final class HomeInteractor {

    @Published internal var movies: [Movie] = []

    private let service: WebServiceProtocol

    init(service: WebServiceProtocol) {
        self.service = service
    }

    func searchReviews(for movie: String) {
        service?.search(movie: movie, completion: { [weak self] (response) in
            guard let response = response else {
                return
            }
            self?.movies = response.map(MoviePresentation.init)
        })
    }

}
