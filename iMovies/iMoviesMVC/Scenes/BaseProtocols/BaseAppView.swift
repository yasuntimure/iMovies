//
//  ViewProtocol.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import Combine
import UIKit

// MARK: Base App View Protocol

public protocol BaseAppView: AnyObject {
    func setup()
    func setConstraints()
    func registerObservers()
}

extension BaseAppView where Self: UIView {

    /// Start initializing the base `BaseAppView` protocol methods
    public func configureContents() {
        self.setup()
        self.registerObservers()
        self.setConstraints()
    }

}
