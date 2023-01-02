//
//  SplashController.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Foundation
import UIKit

final class SplashController: UIViewController {

    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let homeController = HomeBuilder.make()
            self.present(homeController.embedInNavigationController(), animated: false)
        }
    }

}
