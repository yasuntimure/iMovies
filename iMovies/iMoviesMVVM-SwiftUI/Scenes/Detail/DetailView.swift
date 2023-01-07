//
//  DetailView.swift
//  iMoviesMVVM-SwiftUI
//
//  Created by Eyüp Yasuntimur on 7.01.2023.
//

import SwiftUI
import Kingfisher

struct DetailView: View {

    @State var movie: MoviePresentation?

    var body: some View {

        VStack (spacing: 15) {
            HeaderView(movie: movie)
            BodyView(summary: movie?.summary)
            Spacer()
        }
            .edgesIgnoringSafeArea(.top)
    }
}


// MARK: - Header View

struct HeaderView: View {

    var movie: MoviePresentation?

    var body: some View {
        ZStack {
            KFImage(movie?.imageUrl?.getURL())
                .resizable()
                .scaledToFill()
                .frame(width: ScreenSize.width,
                       height: ScreenSize.height / 3,
                       alignment: .center)
                .opacity(0.7)

            Text(movie?.title ?? "")
                .frame(width: ScreenSize.width - 30,
                       height: ScreenSize.height / 3 - 15,
                       alignment: .bottomLeading)
                .font(AppFont.Black.font(size: .xlarge))
                .foregroundColor(.white)
                .lineLimit(1)
        }
            .background(.black)
    }
}


// MARK: - Body View

struct BodyView: View {

    var summary: String?

    var body: some View {
        Text(summary ?? "")
            .font(AppFont.Book.font(size: .medium))
            .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
