//
//  DetailController.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 30.12.2022.
//

import UIKit
import Combine
import iMoviesAPI

class DetailController: UIViewController, BaseAppController {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewImpl: DetailView?

    @Published internal var movie: MoviePresentation?

    convenience init(
        view: DetailView?,
        movie: MoviePresentation?
    ) {
        self.init(nibName: nil, bundle: nil)
        self.viewImpl = view
        self.movie = movie
        self.configureController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

    func registerObservers() {

        $viewImpl.sink { [weak self] _view in
            guard let view = _view else { return }
            view.frame = UIScreen.main.bounds
            // TODO: view implementation
            self?.view.addSubview(view)
        }.store(in: &subscribers)

        $movie.sink { movie in
            self.viewImpl?.movie = movie
        }.store(in: &subscribers)
    }

}

