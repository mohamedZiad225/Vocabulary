//
//  SelectionTableViewCell.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
//    MARK: - Outlets
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var backGroundMainView: UIView!
    @IBOutlet weak var buttonBackground: UIView!
    
    // MARK: - Properties
    private var isCircleSelected: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackGroundView()
        setupCircleButton()
        selectionStyle = .none
        layoutIfNeeded()
        makeCircle()
    }
 
    private func setupBackGroundView() {
        backGroundMainView.layer.cornerRadius = 8
    }
    
    private func setupCircleButton() {
        circleButton.layer.borderWidth = 2
        circleButton.layer.borderColor = UIColor.black.cgColor
        circleButton.clipsToBounds = true
        circleButton.backgroundColor = .clear
    }
    
    private func makeCircle() {
        circleButton.layer.cornerRadius = circleButton.frame.width / 2
        buttonBackground.layer.cornerRadius = buttonBackground.frame.width / 2
    }
    
    func configure(_ model: SelectionUIModel, selected: Bool = false) {
        selectionLabel.text = model.selectionText
        isCircleSelected = selected
        updateCircleAppearance()
    }
    
    func toggleSelection() {
        isCircleSelected.toggle()
        updateCircleAppearance()
    }
    
    private func updateCircleAppearance() {
        circleButton.backgroundColor = isCircleSelected ? UIColor.black : .clear
    }
}
