//
//  HomeRouter.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {

    unowned let view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }

    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let moviePresentation):
            let detailView = DetailBuilder.make(moviePresentation: moviePresentation)
            view.show(detailView, sender: nil)
        }
    }
}

