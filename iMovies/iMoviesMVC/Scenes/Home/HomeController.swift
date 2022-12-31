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

    var service: WebServiceProtocol?

    private var movieList: SearchReponseModel?

    convenience init(
        view: HomeView?,
        service: WebServiceProtocol?
    ) {
        self.init(nibName: nil, bundle: nil)
        self.viewImpl = view
        self.service = service
        self.configureController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchReviews(for: "all")
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

    }

    func searchReviews(for movie: String) {
        service?.search(movie: movie, completion: { [weak self] (response) in
            guard let response = response else {
                return
            }
            self?.viewImpl?.movies = response.map(MoviePresentation.init)
        })
    }

}
