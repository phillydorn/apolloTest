//
//  NibInstantiable.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import Foundation

import UIKit

protocol NibInstantiable {
    static func fromNib() -> Self
}

extension NibInstantiable where Self: UIView {
    static func fromNib() -> Self {
        let className = String(describing: self)
        let nib = UINib(nibName: className, bundle: nil)
        guard let instance = nib.instantiate(withOwner: nil).first as? Self else {
            fatalError("Nib for \(className) doesn't exist or doesn't have a \(className) as its first object.")
        }
        return instance
    }
}
