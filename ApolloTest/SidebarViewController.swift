//
//  SidebarViewController.swift
//  ApolloTest
//
//  Created by Maya Saxena on 10/12/20.
//

import UIKit

protocol SidebarViewControllerDelegate: class {
    func pageSelected(_ page: SidebarPage)
}

enum SidebarPage: CaseIterable {
    case models
    case photoSets

    var title: String {
        switch self {
        case .models:
            return "3D Models"
        case .photoSets:
            return "Photo Sets"
        }
    }

    static func at(indexPath: IndexPath) -> SidebarPage? {
        guard indexPath.row < SidebarPage.allCases.count else { return nil }
        return SidebarPage.allCases[indexPath.row]
    }
}

class SidebarViewController: UITableViewController {
    weak var delegate: SidebarViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage.sidebarLogo)
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .sidebarGray
        navigationController?.navigationBar.standardAppearance = appearance


        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        delegate?.pageSelected(.models)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SidebarPage.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: SidebarTableViewCell.self, indexPath: indexPath)
        cell?.titleLabel.text = SidebarPage.at(indexPath: indexPath)?.title
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let page = SidebarPage.at(indexPath: indexPath) else { return }
        delegate?.pageSelected(page)
    }
}

final class SidebarTableViewCell: UITableViewCell {
    @IBOutlet private var selectedView: UIView!
    @IBOutlet fileprivate var iconLabel: UILabel!
    @IBOutlet fileprivate var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectedView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedView.isHidden = !selected
    }
}
