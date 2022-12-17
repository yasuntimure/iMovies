//
//  ControllerProtocol.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 17.12.2022.
//

import UIKit

public protocol ControllerProtocol {
    associatedtype ViewType: ViewProtocol
    var viewImpl: ViewType? { get set }
    func registerObservers()
}

extension ControllerProtocol where Self: UIViewController {
    public var viewImpl: ViewType? {
        get { return self.view as? ViewType }
        set {}
    }
}
