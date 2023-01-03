//
//  UIImageView+Extension.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit
import Kingfisher

// MARK: - Kingfiher
extension UIImageView {

    func setKfImage(for urlString: String?) {
        guard let urlString = urlString else {
            return
        }
        let url = URL(string: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, options: KingfisherManager.shared.defaultOptions)
    }

}
