//
//  MoviePresentation.swift
//  MovieBoxMVC
//
//  Created by Ilter Cengiz on 18/11/18.
//  Copyright © 2018 Late Night Muhabbetleri. All rights reserved.
//

import UIKit
import iMoviesAPI

typealias MoviePresentations = [MoviePresentation]

struct MoviePresentation: Hashable {
    let title: String?
    let summary: String?
    let imageUrl: String?
}


extension Movie {
    func map() -> MoviePresentation {
        return MoviePresentation(title: self.displayTitle,
                                 summary: self.summaryShort,
                                 imageUrl: self.multimedia?.src)
    }
}
