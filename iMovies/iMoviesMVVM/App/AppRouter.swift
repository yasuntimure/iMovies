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
        window = UIWindow(frame: UIScreen.main.bounds)
    }

    func start() {
        let viewController = SplashController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
