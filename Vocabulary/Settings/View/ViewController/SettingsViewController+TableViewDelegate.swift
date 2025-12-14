//
//  SettingsViewController+TableViewDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.settingsData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settingsData[section].options.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.settingsData[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        let option = viewModel.settingsData[indexPath.section].options[indexPath.row]
        cell.configureCell(option)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SettingsTableViewCell else { return }
        generator.impactOccurred()
        UIView.animate(withDuration: 0.12, animations: {
            cell.mainBackgroundView.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { _ in
            UIView.animate(withDuration: 0.18) {
                cell.mainBackgroundView.transform = .identity
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.handleSettingsSelection(at: indexPath)
        }
    }

    // MARK: - Handle Navigation
    private func handleSettingsSelection(at indexPath: IndexPath) {
        let section = viewModel.settingsData[indexPath.section]
        let option = section.options[indexPath.row]

        switch (section.title, option.title) {
        case ("Voice Over", "Change Voice Over"):
            viewModel.navigateToChangeVoiceOver()
        default:
            break
        }
    }
}
