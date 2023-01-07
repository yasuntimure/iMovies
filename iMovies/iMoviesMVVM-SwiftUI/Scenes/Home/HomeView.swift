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
                .toolbar {
                    ToolbarItem(placement: .principal) {
                    Text(title).font(.headline)
                }
            }
        }
    }
}


// MARK: - HomeTableView

struct HomeTableView: View {

    var movies: [MoviePresentation] = []

    var body: some View {
        List(movies, id: \.self) {
            HomeCellView(movie: $0)
                .padding([.top, .bottom], 10)
        }
            .listStyle(PlainListStyle())
            .padding(.top, -50)
    }
}


// MARK: - HomeCellView

struct HomeCellView: View {

    @State var movie: MoviePresentation?

    var body: some View {
        HStack {
            KFImage(movie?.imageUrl?.getURL())
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 85, alignment: .center)
                .cornerRadius(12)

            VStack (alignment: .leading) {
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





