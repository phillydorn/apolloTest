//
//  UIViewController+Extensions.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

extension UIViewController {
    static func instantiateFromStoryboard() -> Self {
        let className = String(describing: self)
        guard let viewController = UIStoryboard(name: className, bundle: nil)
            .instantiateInitialViewController() as? Self else {
                fatalError("Expected \(className) in this storyboard.")
        }
        return viewController
    }
}
