//
//  AppContainer.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 6.12.2022.
//

import Foundation
import iMoviesAlamofireAPI

let app = AppContainer()

final class AppContainer {

    let router = AppRouter()
    let service = TopMoviesService()
}
