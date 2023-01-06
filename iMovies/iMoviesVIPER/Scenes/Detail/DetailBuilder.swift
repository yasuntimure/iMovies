//
//  DetailBuilder.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import Foundation

final class DetailBuilder {

    static func make(moviePresentation: MoviePresentation) -> DetailViewController {
        let viewController = DetailViewController()
        let presenter = DetailPresenter(view: viewController, moviePresentation: moviePresentation)
        viewController.presenter = presenter
        return viewController
    }
}
