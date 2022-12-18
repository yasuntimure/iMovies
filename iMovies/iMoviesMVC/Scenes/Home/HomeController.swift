//
//  ViewController.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import UIKit
import Combine
import iMoviesAPI

class HomeController: UIViewController, ControllerProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewImpl: HomeView?

    private var service: TopMoviesServiceProtocol?

    private var movieList: [Movie] = []

    convenience init(view: HomeView?) {
        self.init(nibName: nil, bundle: nil)
        self.viewImpl = view
        self.configureController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iMovies"
    }

    func registerObservers() {
        $viewImpl.sink { [weak self] view in
            guard let view = view else { return }
            view.frame = UIScreen.main.bounds
            // TODO: view implementation
            view.backgroundColor = .systemPink
            self?.view.addSubview(view)
        }.store(in: &subscribers)

    }

    func fetchTopMovies() {
        service.fetchTopMovies { [weak self] result in

            self.viewImpl?.isLoading = true

            switch result {
            case .success(let value):
                let moviePresentations = value.results.map(MoviePresentation.init)
                self.viewImpl?.viewModel = moviePresentations
            case .failure(let error):
                print(error)
            }

            self.viewImpl?.isLoading = false
        }
    }

}

