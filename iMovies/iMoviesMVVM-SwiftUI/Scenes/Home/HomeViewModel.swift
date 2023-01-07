//
//  HomeViewModel.swift
//  iMoviesMVVM-SwiftUI
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import SwiftUI
import iMoviesAPI

final class HomeViewModel: ObservableObject {

    @Published var movies: MoviePresentations = []

    internal var service: WebServiceProtocol?

    init(service: WebServiceProtocol?) {
        self.service = service
        searchReviews(for: "all")
    }

    func searchReviews(for movie: String) {
        service?.search(movie: movie, completion: { [weak self] (response) in
            guard let response = response else {
                return
            }
            DispatchQueue.main.async {
                self?.movies = response.map({ $0.map() })
            }
        })
    }
}

