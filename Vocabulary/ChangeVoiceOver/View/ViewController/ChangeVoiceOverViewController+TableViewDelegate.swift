//
//  ChangeVoiceOverViewController+TableViewDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//
import UIKit

//
//  ChangeVoiceOverViewController+TableViewDelegate.swift
//  Vocabulary
//

import UIKit

extension ChangeVoiceOverViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.voices.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "VoiceOverTableViewCell",
            for: indexPath
        ) as! VoiceOverTableViewCell

        let voice = viewModel.voices[indexPath.row]
        let isSelected = indexPath.row == viewModel.selectedVoiceIndex
        cell.conigureCell(voice, isSelected: isSelected)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        generator.impactOccurred()
        let previousIndex = viewModel.selectedVoiceIndex
        viewModel.selectVoice(at: indexPath.row)
        var indexPathsToReload: [IndexPath] = []
        if let previousIndex = previousIndex {
            indexPathsToReload.append(IndexPath(row: previousIndex, section: 0))
        }
        indexPathsToReload.append(IndexPath(row: indexPath.row, section: 0))
        tableView.reloadRows(at: indexPathsToReload, with: .none)
        animateCell(at: indexPath.row)
    }

    private func animateCell(at index: Int) {
        guard let selectedCell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? VoiceOverTableViewCell else { return }
        UIView.animate(withDuration: 0.12, animations: {
            selectedCell.mainBackgroundView.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { _ in
            UIView.animate(withDuration: 0.18) {
                selectedCell.mainBackgroundView.transform = .identity
            }
        })
    }
}
