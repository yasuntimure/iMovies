//
//  HomeBuilder.swift
//  iMoviesMVVM-SwiftUI
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import Foundation

final class HomeBuilder {

    static func make() -> HomeView {
        let viewModel = HomeViewModel(service: app.service)
        let view = HomeView(viewModel: viewModel)
        return view
    }
}
