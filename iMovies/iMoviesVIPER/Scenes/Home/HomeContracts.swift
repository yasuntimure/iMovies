//
//  HomeContracts.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import Foundation
import struct iMoviesAPI.Movie

// MARK: - Interactor

protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
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
    func load()
    func selectMovie(at index: Int)
}

enum HomePresenterOutput {
    case updateTitle(String)
    case showMovies([MoviePresentation])
}


// MARK: - View

protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}


// MARK: - Router

protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}

enum HomeRoute {
    case detail(MoviePresentation)
}
