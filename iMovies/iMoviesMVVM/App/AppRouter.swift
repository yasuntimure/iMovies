//
//  AppRouter.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import UIKit

final class AppRouter {

    let window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.nativeBounds)
    }

    func start() {
        let homeController = HomeBuilder.make()
        let navigationController = homeController.embedInNavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
