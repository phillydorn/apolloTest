//
//  CardGridView.swift
//  
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

class CardGridView: UIView, NibInstantiable, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet private var iconLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!

    private var cellType: UICollectionViewCell.Type!
    private var viewModel: CardGridViewModel!

    static func instantiate(viewModel: CardGridViewModel, cellType: UICollectionViewCell.Type) -> CardGridView {
        let view = CardGridView.fromNib()
        view.viewModel = viewModel
        view.cellType = cellType
        view.setup()
        return view
    }

    private func setup() {
        iconLabel.text = viewModel.iconText
        titleLabel.text = viewModel.titleText

        collectionView.collectionViewLayout = generateLayout()
        collectionView.registerNib(type: cellType)
    }

    private func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(312))

            let count: Int
            if environment.traitCollection.horizontalSizeClass == .regular {
                count = environment.container.contentSize.width > 1000 ? 3 : 2 // TODO: Define global breakpoints if needed
            } else {
                count = environment.container.contentSize.width > 600 ? 2 : 1 // TODO: Define global breakpoints if needed
            }

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: itemSize,
                subitem: NSCollectionLayoutItem(layoutSize: itemSize),
                count: count
            )

            return NSCollectionLayoutSection(group: group)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueCell(type: cellType, indexPath: indexPath) ?? UICollectionViewCell()
    }
}
