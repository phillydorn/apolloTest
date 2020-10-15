//
//  Contraints+Extensions.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

extension UIView {
    func constrainToAllEdges(of parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            topAnchor.constraint(equalTo: parentView.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
}
