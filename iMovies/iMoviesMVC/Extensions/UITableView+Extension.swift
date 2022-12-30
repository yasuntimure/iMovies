//
//  UITableView+Extension.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type) where T: Reuseable {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
