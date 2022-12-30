//
//  ViewProtocol.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import Combine
import UIKit

// MARK: Base View Protocol

public protocol ViewProtocol: AnyObject {
    func setup()
    func setConstraints()
    func registerObservers()
}

extension ViewProtocol where Self: UIView {

    /// Start initializing the base `AppView` protocol methods
    public func configureContents() {
        self.setup()
        self.registerObservers()
        self.setConstraints()
    }

}
