//
//  AppContainer.swift
//  iMoviesVIPER
//
//  Created by Eyüp Yasuntimur on 5.01.2023.
//

import Foundation
import iMoviesAPI

let app = AppContainer()

final class AppContainer {

    let router = AppRouter()
    let service = WebService()
}

