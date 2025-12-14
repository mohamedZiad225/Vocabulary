//
//  WelcomeViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

class WelcomeViewController: UIViewController {
//    MARK: - Outlets:
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
//    MARK: - ViewModel
    var viewModel: WelcomeViewModel!
    let generator = UIImpactFeedbackGenerator(style: .light)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateEntrance()
    }
    
    private func setupUI() {
        titleLabel.text = "Welcome to Vocabulary"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        
        subtitleLabel.text = "Learn new words every day and expand your language skills."
        subtitleLabel.font = UIFont.systemFont(ofSize: 17)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.backgroundColor = .systemBlue
        getStartedButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.layer.cornerRadius = 12
    }
  
    private func animateEntrance() {
        let viewsToAnimate = [mainImageView, titleLabel, subtitleLabel, getStartedButton]
        viewsToAnimate.forEach {
            $0?.alpha = 0
            $0?.transform = CGAffineTransform(translationX: 0, y: 20)
        }
        
        for (index, view) in viewsToAnimate.enumerated() {
            UIView.animate(
                withDuration: 0.6,
                delay: Double(index) * 0.1,
                usingSpringWithDamping: 0.85,
                initialSpringVelocity: 0.4,
                options: .curveEaseOut,
                animations: {
                    view?.alpha = 1
                    view?.transform = .identity
                }
            )
        }
    }
    
    @IBAction func didTapGetStarted(_ sender: Any) {
        generator.impactOccurred()
        viewModel.didTapGetStarted()
    }
}
