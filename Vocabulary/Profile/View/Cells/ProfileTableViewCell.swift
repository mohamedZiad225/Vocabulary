//
//  ProfileTableViewCell.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 14/12/2025.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        mainBackgroundView.layer.cornerRadius = 8
        mainBackgroundView.layer.masksToBounds = false
        mainBackgroundView.layer.shadowColor = UIColor.black.cgColor
        mainBackgroundView.layer.shadowOpacity = 0.15
        mainBackgroundView.layer.shadowRadius = 6
        mainBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func configureCell(_ model: ProfileDetailsUIModel) {
        titleLabel.text = model.description
    }
}
