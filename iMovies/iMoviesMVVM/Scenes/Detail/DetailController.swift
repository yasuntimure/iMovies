//
//  DetailController.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 2.01.2023.
//

import UIKit
import Combine
import iMoviesAPI

class DetailController: UIViewController, ControllerProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewImpl: DetailView?
    @Published internal var viewModel: DetailViewModel?

    convenience init(
        view: DetailView?,
        viewModel: DetailViewModel?
    ) {
        self.init(nibName: nil, bundle: nil)
        self.viewImpl = view
        self.viewModel = viewModel
        self.configureController()
    }

    func registerObservers() {

        $viewImpl.sink { [weak self] _view in
            guard let view = _view else { return }
            view.frame = UIScreen.main.bounds
            // TODO: view implementation
            self?.view.addSubview(view)
        }.store(in: &subscribers)

        viewModel?.$movie.sink { [weak self] (movie) in
            self?.viewImpl?.viewModel = movie
        }.store(in: &subscribers)
    }

}


