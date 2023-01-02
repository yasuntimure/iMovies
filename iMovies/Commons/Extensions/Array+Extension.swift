//
//  Array+Extension.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 1.01.2023.
//

import Foundation

public extension Array {

    struct IndexOutOfBoundsError: Error { }

    func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
