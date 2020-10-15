//
//  Reusable.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/14/20.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableViewCell: ReusableCell {}
extension UITableView {
    func registerNib<T: UITableViewCell>(type: T.Type) {
        register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }
}

extension UICollectionViewCell: ReusableCell {}
extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(type: T.Type) {
        register(type.nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    func dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }
}
