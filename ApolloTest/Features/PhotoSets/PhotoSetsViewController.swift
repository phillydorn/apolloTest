//
//  PhotoSetsViewController.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

class PhotoSetsViewController: UIViewController {
    @IBOutlet var cardGridContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cardGridViewModel = CardGridViewModel(title: "Photo Sets", icon: "?")
        let cardGridView = CardGridView.instantiate(viewModel: cardGridViewModel, cellType: PhotoSetCardGridCollectionViewCell.self)
        cardGridContainerView.addSubview(cardGridView)
        cardGridView.constrainToAllEdges(of: cardGridContainerView)
    }
}
