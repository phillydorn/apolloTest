//
//  PhotoSetCardGridCollectionViewCell.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

final class PhotoSetCardGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var cardView: UIView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var iconLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var menuButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 4
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
