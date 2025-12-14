//
//  SettingsViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class SettingsViewController: UIViewController {
//    MARK: - Outlets
    @IBOutlet weak var settingsTableView: UITableView!
//    MARK: - Properties
    var viewModel: SettingsViewModel!
    let generator = UIImpactFeedbackGenerator(style: .medium)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCell()
        setDate()
    }
    
    private func setDate() {
        settingsTableView.reloadData()
        settingsTableView.isScrollEnabled =  false 
    }
    
    private func registerCell() {
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil),forCellReuseIdentifier: "SettingsTableViewCell"
        )
        settingsTableView.separatorStyle = .none
    }
}
// MARK: - NavigationBar
private extension SettingsViewController {
     func setupNavigationBar() {
        title = "Settings"
    }
}
