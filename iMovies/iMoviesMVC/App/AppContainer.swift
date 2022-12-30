//
//  AppContainer.swift
//  iMoviesMVC
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import Foundation
import iMoviesAPI

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = WebService()
}
