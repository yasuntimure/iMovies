//
//  DetailBuilder.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 31.12.2022.
//

import Foundation

final class DetailBuilder {

    static func make(movie: MoviePresentation) -> DetailController {
        let view = DetailView()
        let controller = DetailController(view: view, movie: movie)
        return controller
    }
}
