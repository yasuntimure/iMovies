//
//  DetailContracts.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import UIKit

protocol DetailPresenterProtocol {
    func load()
}

protocol DetailViewProtocol: AnyObject {
    func update(_ presentation: MoviePresentation)
}
