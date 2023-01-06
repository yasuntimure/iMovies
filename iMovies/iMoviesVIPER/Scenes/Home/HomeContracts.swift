//
//  HomeContracts.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import Foundation
import iMoviesAPI

// MARK: - Interactor

protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    var service: WebServiceProtocol { get set }
    var movies: [Movie] { get set }
    func searchReviews()
    func selectMovie(at index: Int)
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

enum HomeInteractorOutput {
    case showMovies([Movie])
    case showMovieDetail(MoviePresentation)
}


// MARK: - Presenter

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol { get set }
    var router: HomeRouterProtocol { get set }
    var interactor: HomeInteractorProtocol { get set }
    func load()
    func selectMovie(at index: Int)
}

enum HomePresenterOutput {
    case updateTitle(String)
    case showMovies([MoviePresentation])
}


// MARK: - View

protocol HomeViewProtocol: AnyObject {
    var movies: MoviePresentations { get set }
    var presenter: HomePresenterProtocol? { get set }
    func handleOutput(_ output: HomePresenterOutput)
}


// MARK: - Router

protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}

enum HomeRoute {
    case detail(MoviePresentation)
}
