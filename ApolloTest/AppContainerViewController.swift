//
//  AppContainerViewController.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

class AppContainerViewController: UISplitViewController, SidebarViewControllerDelegate {

    func pageSelected(_ page: SidebarPage) {
        showDetailViewController(page.viewController, sender: self)
    }
}

private extension SidebarPage {
    var viewController: UIViewController {
        switch self {
        case .models:
            return ModelsViewController.instantiateFromStoryboard()
        case .photoSets:
            return PhotoSetsViewController.instantiateFromStoryboard()
        }
    }
}
