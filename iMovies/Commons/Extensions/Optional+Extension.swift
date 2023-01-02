//
//  Optional+Extension.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 1.01.2023.
//

import Foundation

public extension Optional {

    struct FoundNilWhileUnwrappingError: Error { }

    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
