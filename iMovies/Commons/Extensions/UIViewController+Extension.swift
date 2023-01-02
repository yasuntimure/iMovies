//
// UIViewController+Extension.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import Foundation
import UIKit

extension UIViewController {

    func embedInNavigationController(
        _ modalPresentationStyle: UIModalPresentationStyle = .fullScreen
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = modalPresentationStyle
        return navigationController
    }

}

