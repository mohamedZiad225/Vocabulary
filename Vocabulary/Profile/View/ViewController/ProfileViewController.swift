//
//  ProfileViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class ProfileViewController: UIViewController {
//  MARK: - Outlets
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    MARK: - Properties
    var viewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        setupNavigation()
    }
    
    private func setupUI() {
        titleLabel.text = "Profile Details"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    private func setupNavigation() {
        title = "Profile"
    }
    
    private func registerCell() {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self

        detailsTableView.register(
            UINib(nibName: "ProfileTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ProfileTableViewCell"
        )
        detailsTableView.separatorStyle = .none
        detailsTableView.reloadData()
    }
}
