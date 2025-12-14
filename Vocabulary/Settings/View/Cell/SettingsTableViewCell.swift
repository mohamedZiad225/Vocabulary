//
//  SettingsTableViewCell.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI() {
        mainBackgroundView.layer.cornerRadius = 8
        mainBackgroundView.layer.masksToBounds = false
        mainBackgroundView.layer.shadowColor = UIColor.black.cgColor
        mainBackgroundView.layer.shadowOpacity = 0.15
        mainBackgroundView.layer.shadowRadius = 6
        mainBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        settingImageView.tintColor = .black
    }
    
    func configureCell(_ model: SettingsOption) {
        settingLabel.text = model.title
        settingImageView.image =  UIImage(systemName: model.image)
    }
    
}
