//
//  HomeController.swift
//  iMoviesMVVM
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit
import Combine

class HomeController: UIViewController, ControllerProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewImpl: HomeView?
    @Published internal var viewModel: HomeViewModel?

    convenience init(
        view: HomeView?,
        viewModel: HomeViewModel?
    ) {
        self.init(nibName: nil, bundle: nil)
        self.viewImpl = view
        self.viewModel = viewModel
        self.configureController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.searchReviews(for: "all")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "iMovies"
    }

    func registerObservers() {
        $viewImpl.sink { [weak self] _view in
            guard let view = _view else { return }
            view.frame = UIScreen.main.bounds

            view.onCellSelect = { movie in
                let controller = DetailBuilder.make(movie: movie)
                self?.navigationController?.pushViewController(controller, animated: true)
            }

            self?.view.addSubview(view)
        }.store(in: &subscribers)

        viewModel?.$movies.sink{ [weak self] (movies) in
            self?.viewImpl?.movies = movies
        }.store(in: &subscribers)
    }
}
