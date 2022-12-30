//
//  MoviePresentation.swift
//  MovieBoxMVC
//
//  Created by Ilter Cengiz on 18/11/18.
//  Copyright © 2018 Late Night Muhabbetleri. All rights reserved.
//

import UIKit

final class MoviePresentation: NSObject {
    
    let displayTitle: String?
    let mpaaRating: String?
    
    init(displayTitle: String?, mpaaRating: String?) {
        self.displayTitle = displayTitle
        self.mpaaRating = mpaaRating
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.displayTitle == other.displayTitle && self.mpaaRating == other.mpaaRating
    }
}
