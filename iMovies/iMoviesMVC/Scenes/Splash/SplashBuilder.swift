//
//  SplashBuilder.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit

final class SplashBuilder {

    static func make() -> SplashController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SplashController") as! SplashController
        return controller
    }
}
