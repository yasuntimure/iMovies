//
//  ControllerProtocol.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import Foundation
import UIKit

public protocol ControllerProtocol {
    associatedtype ViewType: ViewProtocol
    var viewImpl: ViewType? { get set }
    func registerObservers()
    func configureController()
}

extension ControllerProtocol where Self: UIViewController {
    public var viewImpl: ViewType? {
        get { return self.view as? ViewType }
        set {}
    }

    public func configureController() {
        self.registerObservers()
        self.navigationController?.isNavigationBarHidden = false
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
