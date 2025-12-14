//
//  OnBoardingStatementView.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit
import Lottie

final class OnBoardingStatementView: UIView {

    // MARK: - Outlets
    @IBOutlet private weak var animationView: LottieAnimationView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!

    // MARK: - Callbacks
    var onContinueTapped: (() -> Void)?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
        setupUI()
    }

    // MARK: - Setup
    private func loadFromNib() {
        let nib = UINib(nibName: "OnBoardingStatementView", bundle: nil)
        let contentView = nib.instantiate(withOwner: self).first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }

    private func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)

        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = .systemBlue
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 12
    }

    // MARK: - Configuration
    func configure(_ model: StatmentUIModel) {
        titleLabel.text = model.title
        playAnimation(named: model.image)
    }

    private func playAnimation(named name: String) {
        guard let animation = LottieAnimation.named(name) else { return }

        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }

    // MARK: - Actions
    @IBAction private func didTapContinueButton(_ sender: UIButton) {
        onContinueTapped?()
    }
}
