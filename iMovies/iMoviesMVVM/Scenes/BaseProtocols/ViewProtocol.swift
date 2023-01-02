//
//  BaseViewProtocol.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

#if canImport(UIKit)
import UIKit

// MARK: View Protocol

public protocol ViewProtocol: AnyObject {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
    func setup()
    func registerObservers()
    func setConstraints()
    func configureView(_ viewModel: ViewModel?)
}

extension ViewProtocol where Self: UIView {

    /// Start initializing the base `ViewProtocol` methods
    public func configureContents() {
        self.setup()
        self.registerObservers()
        self.setConstraints()
    }
}
#endif

