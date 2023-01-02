//
//  iMoviesMVCTests.swift
//  iMoviesMVCTests
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import XCTest
@testable import iMoviesAPI
@testable import iMoviesMVC

class iMoviesMVCTests: XCTestCase {

    fileprivate var service: MockService!
    var view: HomeView!
    var controller: HomeController!


    override func setUpWithError() throws {
        service = MockService()
        view = HomeView()
        controller = HomeController()
    }

    override func tearDownWithError() throws {
        service = nil
        view = nil
        controller = nil
    }

    func testMovieList() throws {

        // Given
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        service.movies = [movie1]

        // When
        controller.loadViewIfNeeded()

        // Then
        XCTAssertEqual(view.movies.count, 1)
        XCTAssertEqual(try view.movies.element(at: 0).title, movie1.displayTitle)
    }
}

private final class MockService: WebServiceProtocol {

    var movies: [Movie] = []

    func search(movie: String, completion: @escaping ([Movie]?) -> Void) {
        completion(movies)
    }
}

