//
//  ViewController+Extension.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

/// Define to get the Identifying
protocol Identifying {
    static var identifier: String { get }
}

extension Identifying {
    /// Will return the reuse identifier same a given class.
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UIViewController: Identifying {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
}
