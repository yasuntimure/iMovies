//
//  UICollectionView+Extension.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(type: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
