//
//  ContentView.swift
//  iMoviesMVVM-SwiftUI
//
//  Created by Eyüp Yasuntimur on 6.01.2023.
//

import SwiftUI
import Kingfisher
import iMoviesAPI

struct HomeView: View {

    @State var title: String = "iMovies"

    @ObservedObject internal var viewModel: HomeViewModel

    var body: some View {

        NavigationView {
            HomeTableView(movies: viewModel.movies)
                .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title).font(.headline)
                }
            }
        }

    }

}

struct HomeTableView: View {

    var movies: [MoviePresentation] = []

    var body: some View {
        List(movies, id: \.self) {
            HomeCellView(movie: $0)
        }
    }
}


struct HomeCellView: View {

    @State var movie: MoviePresentation?

    var body: some View {
        HStack {
            KFImage(movie?.imageUrl?.getURL())
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(12)
                .padding(.trailing)

            VStack (alignment: .leading) {
                Text(movie?.title ?? "")
                    .font(AppFont.Medium.font(size: .mediumlarge))
                Text(movie?.summary ?? "")
                    .font(AppFont.Medium.font(size: .smallmedium))
            }
        }
            .padding()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(service: app.service))
    }
}

extension String {

    func getURL() -> URL? {
        return URL(string: self)
    }
}





