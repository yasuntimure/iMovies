//
//  iMoviesMVVM_SwiftUIApp.swift
//  iMoviesMVVM-SwiftUI
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import SwiftUI

@main
struct iMoviesMVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(service: app.service))
        }
    }
}
