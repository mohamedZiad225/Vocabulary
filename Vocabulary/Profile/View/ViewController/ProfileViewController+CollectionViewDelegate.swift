//
//  ProfileViewController+CollectionViewDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProfileTableViewCell",
            for: indexPath
        ) as! ProfileTableViewCell

        let item = viewModel.sections[indexPath.section].rows[indexPath.row]
        cell.configureCell(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        viewModel.sections[section].title
    }
}


extension UILabel {
    func padding(left: CGFloat, right: CGFloat) {
        let inset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        drawText(in: bounds.inset(by: inset))
    }
}
