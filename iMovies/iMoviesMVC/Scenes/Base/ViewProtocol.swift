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
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
    func setup()
    func setConstraints()
    func configureView(_ viewModel: ViewModel?)
}

extension ViewProtocol where Self: UIView {

    /// Start initializing the base `AppView` protocol methods
    public func configureContents() {
        self.setup()
        self.setConstraints()
    }

}
