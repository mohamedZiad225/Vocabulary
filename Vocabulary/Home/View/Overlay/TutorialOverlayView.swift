//
//  TutorialOverlayView.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

final class TutorialOverlayView: UIView {
    // MARK: - UI
    private let handImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let borderView = UIView()
    // MARK: - Callback
    var nextStep: (() -> Void)?

    // MARK: - Init
    init(targetView: UIView,message: String,   handImage: UIImage? = nil  ) {
        super.init(frame: UIScreen.main.bounds)
        addAnimation()
        let targetFrame = targetView.convert(targetView.bounds, to: nil)
        applyClearHighlight(frame: targetFrame, cornerRadius: targetView.layer.cornerRadius)
        setupBorder(frame: targetFrame, cornerRadius: targetView.layer.cornerRadius )
        setupHandImage(frame: targetFrame, image: handImage )
        setupDescription( message: message, below: handImageView)
        animateHand()
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissOverlay))
        addGestureRecognizer(tap)
    }
    
   private  func addAnimation() {
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

    // MARK: - Highlight Mask
    private func applyClearHighlight(frame: CGRect, cornerRadius: CGFloat) {
        let overlayPath = UIBezierPath(rect: bounds)
        let holePath = UIBezierPath(
            roundedRect: frame.insetBy(dx: -8, dy: -8),
            cornerRadius: cornerRadius + 8
        )

        overlayPath.append(holePath)
        overlayPath.usesEvenOddFillRule = true

        let maskLayer = CAShapeLayer()
        maskLayer.path = overlayPath.cgPath
        maskLayer.fillRule = .evenOdd

        layer.mask = maskLayer
    }

    // MARK: - Border
    private func setupBorder(frame: CGRect, cornerRadius: CGFloat) {
        borderView.frame = frame.insetBy(dx: -8, dy: -8)
        borderView.layer.cornerRadius = cornerRadius + 8
        borderView.layer.borderWidth = 3
        borderView.layer.borderColor = UIColor.white.cgColor
        borderView.backgroundColor = .clear
        addSubview(borderView)
    }

    // MARK: - Hand
    private func setupHandImage(frame: CGRect, image: UIImage?) {
        handImageView.image = image ?? UIImage(systemName: "hand.point.up.left.fill")
        handImageView.tintColor = .white
        handImageView.frame = CGRect(
            x: frame.midX - 30,
            y: frame.maxY + 12,
            width: 60,
            height: 60
        )
        addSubview(handImageView)
    }

    private func animateHand() {
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            options: [.repeat, .autoreverse],
            animations: {
                self.handImageView.transform = CGAffineTransform(translationX: 0, y: 10)
            }
        )
    }

    // MARK: - Description
    private func setupDescription(message: String, below view: UIView) {
        descriptionLabel.text = message
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.frame = CGRect(
            x: 40,
            y: view.frame.maxY + 8,
            width: UIScreen.main.bounds.width - 80,
            height: 60
        )
        addSubview(descriptionLabel)
    }

    // MARK: - Dismiss
    @objc private func dismissOverlay() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.alpha = 0
            },
            completion: { _ in
                self.handImageView.layer.removeAllAnimations()
                self.removeFromSuperview()
                self.nextStep?()
            }
        )
    }


    // MARK: - Required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
