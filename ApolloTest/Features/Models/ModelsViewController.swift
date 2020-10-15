//
//  ModelsViewController.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

class ModelsViewController: UIViewController {
    @IBOutlet private var cardGridContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true

        let cardGridViewModel = CardGridViewModel(title: "Models", icon: "?")
        let cardGridView = CardGridView.instantiate(viewModel: cardGridViewModel, cellType: ModelCardGridCollectionViewCell.self)
        cardGridContainerView.addSubview(cardGridView)
        cardGridView.constrainToAllEdges(of: cardGridContainerView)
    }

    @IBAction private func menuButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
