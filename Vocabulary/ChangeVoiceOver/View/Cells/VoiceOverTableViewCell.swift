//
//  VoiceOverTableViewCell.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class VoiceOverTableViewCell: UITableViewCell {
    //     MARK: - Outlets
    @IBOutlet weak var voiceOverLabel: UILabel!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var mainBackgroundView: UIView!
    
    private var isSelectedVoice: Bool = false
    var didToggleSelection: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
        makeCircle()
    }
    
    func setupUI() {
        mainBackgroundView.layer.cornerRadius = 8
        mainBackgroundView.layer.masksToBounds = false
        mainBackgroundView.layer.shadowColor = UIColor.black.cgColor
        mainBackgroundView.layer.shadowOpacity = 0.15
        mainBackgroundView.layer.shadowRadius = 6
        mainBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        checkBoxButton.layer.borderWidth = 2
        checkBoxButton.layer.borderColor = UIColor.black.cgColor
        checkBoxButton.backgroundColor = .clear
        checkBoxButton.clipsToBounds = true
    }
    
    private func makeCircle() {
        checkBoxButton.layer.cornerRadius = checkBoxButton.frame.width / 2
        buttonBackgroundView.layer.cornerRadius = buttonBackgroundView.frame.width / 2
    }
    
    func conigureCell(_ model: VoiceUIModel, isSelected: Bool) {
        voiceOverLabel.text = model.name
        isSelectedVoice = isSelected
        updateCircleAppearance()
    }
    
    private func updateCircleAppearance() {
        checkBoxButton.backgroundColor = isSelectedVoice ? UIColor.black : .clear
    }
}
