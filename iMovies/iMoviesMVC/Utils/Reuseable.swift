//
//  Reuseable.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import Foundation
import UIKit

protocol Reuseable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reuseable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
