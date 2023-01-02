//
//  ResourceLoader.swift
//  iMoviesMVCTests
//
//  Created by Eyüp Yasuntimur on 1.01.2023.
//

import Foundation
import iMoviesAPI

class ResourceLoader {

    enum MovieResource: String {
        case movie1
        case movie2
        case movie3
    }

    static func loadMovie(resource: MovieResource) throws -> Movie {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: ".json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        return movie
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}


