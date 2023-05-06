//
//  UITableView+Extensions.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

public extension UITableView {
    /// This will dequeue the cell by given indexPath.
    /// - Parameters
    ///     - indexPath:  specify the indexPath for the cell.
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue with the given identifier\(T.reuseIdentifier)")
        }
        return cell
    }
}
