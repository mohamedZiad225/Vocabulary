//
//  homeCollectionViewCell.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import UIKit
import AVFoundation

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var accessibilityButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
         setupFont()
     }
     
     private func setupFont() {
         wordLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
         descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)

         let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
         let icon = UIImage(systemName: "person.wave.2", withConfiguration: config)

         accessibilityButton.setImage(icon, for: .normal)
         accessibilityButton.setTitle("  Listen", for: .normal)
         accessibilityButton.tintColor = .white
         accessibilityButton.backgroundColor = .systemMint
         accessibilityButton.layer.cornerRadius = 8
     }

     func configureCell(_ model: VocabWordsUIModel) {
         wordLabel.text = model.word
         descriptionLabel.text = model.description
     }

    @IBAction func didTapAccessibilityButton(_ sender: Any) {
        SpeachManager.shared.speak(self.wordLabel.text ?? "", volume: 5)
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
     }
}
