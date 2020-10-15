//
//  UIColor+Theme.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1.0) {
        self.init(displayP3Red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }

    static let sidebarGray = UIColor(r: 242, g: 242, b: 242)
}
