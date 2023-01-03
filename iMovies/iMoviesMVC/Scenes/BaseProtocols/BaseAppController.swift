//
//  ControllerProtocol.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit

public protocol BaseAppController {
    associatedtype ViewType: BaseAppView
    var viewImpl: ViewType? { get set }
    func registerObservers()
    func configureController()
}

extension BaseAppController where Self: UIViewController {
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
