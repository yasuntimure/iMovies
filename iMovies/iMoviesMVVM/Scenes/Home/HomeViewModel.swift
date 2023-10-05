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

    func fetchMovies() {
        let networking = Networking()
        let endpoint = MovieEndpoint.upcoming
        Task {
            do {
                let response: UpcomingReponseModel = try await networking.request(endpoint)
                if let results = response.results {
                    self.movies = results.map({ $0.map() })
                }
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
}
