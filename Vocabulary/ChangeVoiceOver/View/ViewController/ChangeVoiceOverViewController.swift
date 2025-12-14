//
//  ChangeVoiceOverViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class ChangeVoiceOverViewController: UIViewController {
//    MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
//    MARK: - Properties
    let generator = UIImpactFeedbackGenerator(style: .medium)
    var viewModel: ChangeVoiceOverViewModel!
//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        viewModel.loadVoices()
    }

    private func registerCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "VoiceOverTableViewCell", bundle: nil),forCellReuseIdentifier: "VoiceOverTableViewCell"
        )
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func handleCustomBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(didTapBackButton)
        )
    }
    
    @objc private func didTapBackButton() {
        viewModel.resetToOriginalVoice()
        viewModel.navigateBack()
    }
    
    private func setupUI() {
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = .systemBlue
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 12
    }
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        viewModel.confirmSelection()
        viewModel.navigateToRoot()
    }
}
