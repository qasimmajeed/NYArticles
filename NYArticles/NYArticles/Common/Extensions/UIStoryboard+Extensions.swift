//
//  UIStoryboard+Extensions.swift
//  NYArticles
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import UIKit

extension UIStoryboard {
    /// Define all the storyboards name here
    enum Name: String {
        case articles = "Article"
    }

    convenience init(name: Name, bundle: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: bundle)
    }
}
