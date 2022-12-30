//
//  MoviePresentation.swift
//  MovieBoxMVC
//
//  Created by Ilter Cengiz on 18/11/18.
//  Copyright © 2018 Late Night Muhabbetleri. All rights reserved.
//

import UIKit
import iMoviesAPI

final class MoviePresentation: NSObject {
    
    let title: String?
    let summary: String?
    let imageUrl: String?
    
    init(
        title: String?,
        summary: String?,
        imageUrl: String?
    ) {
        self.title = title
        self.summary = summary
        self.imageUrl = imageUrl
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.summary == other.summary
    }
}

extension MoviePresentation {

    convenience init(movie: Result) {
        self.init(title: movie.displayTitle,
                  summary: movie.summaryShort,
                  imageUrl: movie.multimedia?.src)
    }
}
