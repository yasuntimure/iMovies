//
//  HomeBuilder.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit

final class HomeBuilder {

    static func make() -> HomeController {
        let view = HomeView()
        let viewModel = HomeViewModel(service: app.service)
        let controller = HomeController(view: view,
                                        viewModel: viewModel)
        return controller
    }
}
