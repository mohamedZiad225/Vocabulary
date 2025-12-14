//
//  MultipleSelectionCollectionViewCell+TableViewDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

extension MultipleSelectionView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectionData.count
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell", for: indexPath) as! SelectionTableViewCell
        
        let item = selectionData[indexPath.row]
        cell.configure(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell else { return }
        cell.toggleSelection()
        UIView.animate(withDuration: 0.20,
                       animations: {
            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            cell.alpha = 0.7
        },completion: {[weak self] _ in
            guard let self = self else {return}
            UIView.animate(withDuration: 0.20) {
                cell.transform = .identity
                cell.alpha = 1
                self.didSelectItem?(self.selectionData[indexPath.row])
            }
        })
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
          cell.alpha = 0
          cell.transform = CGAffineTransform(translationX: 0, y: 20)
          UIView.animate(
              withDuration: 0.8,
              delay: 0.09 * Double(indexPath.row),
              options: [.curveEaseOut],
              animations: {
                  cell.alpha = 1
                  cell.transform = .identity
              }
          )
      }
}
