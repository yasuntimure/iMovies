//
//  AppDelegate.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        app.router.start()

        return true
    }

}

