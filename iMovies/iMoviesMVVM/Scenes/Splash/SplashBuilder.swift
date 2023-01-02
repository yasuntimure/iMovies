//
//  SplashBuilder.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit

final class SplashBuilder {

    static func make() -> SplashController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SplashController") as! SplashController
        return controller
    }
}
