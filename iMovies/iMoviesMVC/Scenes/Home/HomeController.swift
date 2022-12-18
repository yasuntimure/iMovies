//
//  ViewController.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import UIKit
import Combine

class HomeController: UIViewController, ControllerProtocol {

    private var subscribers = Set<AnyCancellable>()

    @Published internal var viewImpl: HomeView?

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

}

