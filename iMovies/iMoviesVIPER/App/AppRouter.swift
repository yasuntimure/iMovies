//
//  AppRouter.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import UIKit

final class AppRouter {

    let window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }

    func start() {
        let homeController = HomeBuilder.make()
        let navigationController = homeController.embedInNavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

