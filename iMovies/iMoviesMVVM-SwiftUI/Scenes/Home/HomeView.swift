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

    @State var title: String = "Movies"

    @ObservedObject internal var viewModel: HomeViewModel

    var body: some View {

        NavigationView {
            HomeTableView(movies: viewModel.movies)
                .navigationBarTitle(Text(title), displayMode: .inline)
        }
            
    }
}


// MARK: - HomeTableView

struct HomeTableView: View {

    @State var isSelected: Bool = false

    var movies: [MoviePresentation] = []

    var body: some View {
            List(movies, id: \.self) { movie in
                NavigationLink(destination: DetailView(movie: movie)) {
                    HomeCellView(movie: movie)
                        .padding([.top, .bottom], 10)
                }
            }
                .listStyle(PlainListStyle())
    }
}


// MARK: - HomeCellView

struct HomeCellView: View {

    @State var movie: MoviePresentation?

    var body: some View {
        HStack (spacing: 15) {
            KFImage(movie?.imageUrl?.getURL())
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 85, alignment: .center)
                .cornerRadius(12)

            VStack (alignment: .leading, spacing: 3) {
                Text(movie?.title ?? "")
                    .font(AppFont.Medium.font(size: .mediumlarge))
                    .lineLimit(1)
                Text(movie?.summary ?? "")
                    .font(AppFont.Medium.font(size: .smallmedium))
                    .lineLimit(3)
            }
        }
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
