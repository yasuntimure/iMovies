//
//  DetailBuilder.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Foundation

final class DetailBuilder {

    static func make(movie: MoviePresentation) -> DetailController {
        let view = DetailView()
        let viewModel = DetailViewModel(movie: movie)
        let controller = DetailController(view: view,
                                          viewModel: viewModel)
        return controller
    }
}
