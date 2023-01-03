//
//  HomeViewModel.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Combine
import iMoviesAPI

final class HomeViewModel {

    private var subscribers = Set<AnyCancellable>()

    @Published var movies: MoviePresentations = []

    internal var service: WebServiceProtocol?

    init(service: WebServiceProtocol?) {
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
