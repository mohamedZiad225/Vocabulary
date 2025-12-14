//
//  SwipeTutorialOverlay.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//
import UIKit

class SwipeTutorialOverlay: UIView {

    private let handImageView = UIImageView()
    private let messageLabel = UILabel()
    
    var nextStep: (() -> Void)?

    init(targetView: UIView, message: String) {
        super.init(frame: UIScreen.main.bounds)
        animateView()
        addHandView(targetView: targetView, message: message)
        animateSwipe()
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissOverlay))
        addGestureRecognizer(tap)
    }
    
    private func animateSwipe() {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.handImageView.transform = CGAffineTransform(translationX: 0, y: 30)
        })
    }
    
    @objc private func dismissOverlay() {
        self.removeFromSuperview()
        nextStep?()
    }
    
    private func addMessageView(handImageView: UIView, message: String) {
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.frame = CGRect(x: 40, y: handImageView.frame.maxY + 8,
                                    width: UIScreen.main.bounds.width - 80, height: 60)
        addSubview(messageLabel)
    }
    
    private func addHandView(targetView: UIView, message: String) {
        let targetFrame = targetView.convert(targetView.bounds, to: nil)
        let highlightView = UIView(frame: targetFrame)
        highlightView.layer.borderWidth = 2
        highlightView.layer.borderColor = UIColor.white.cgColor
        highlightView.layer.cornerRadius = 12
        highlightView.backgroundColor = .clear
        addSubview(highlightView)
        handImageView.image = UIImage(systemName: "hand.point.up.fill")
        handImageView.tintColor = .white
        handImageView.frame = CGRect(
            x: targetFrame.midX - 30,
            y: targetFrame.midY - 30,
            width: 60,
            height: 60
        )
        addSubview(handImageView)
        addMessageView(handImageView: handImageView, message: message)
    }
    
    private func animateView() {
        alpha = 0
        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            options: [.curveEaseOut],
            animations: {
                self.alpha = 1
                self.transform = .identity
            }
        )
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
