//
//  HomeBuilder.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit

final class HomeBuilder {

    static func make() -> HomeController {
        let view = HomeView()
        let controller = HomeController(view: view)
        controller.service = app.service
        return controller
    }
}
