//
//  DetailViewModel.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Combine
import iMoviesAPI

final class DetailViewModel {

    private var subscribers = Set<AnyCancellable>()

    @Published var movie: MoviePresentation?

    init(movie: MoviePresentation?) {
        self.movie = movie
    }

}

