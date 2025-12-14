//
//  InputView.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

class InputView: UIView {
    
    @IBOutlet weak var continueBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    private var keyboardHeight: CGFloat = 0
    
    // MARK: - Callbacks
    var onContinueTapped: ((_ text: String) -> Void)?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        setupUI()
        registerKeyboardNotifications()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
        setupUI()
        registerKeyboardNotifications()
    }
    
    private func loadFromNib() {
        let nib = UINib(nibName: "InputView", bundle: nil)
        let contentView = nib.instantiate(withOwner: self).first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupUI() {
        questionLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = .systemGray
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 12
        nameTextField.placeholder = "Your name"
        continueButton.isEnabled = false
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let info = notification.userInfo,
              let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        keyboardHeight = keyboardFrame.height
        UIView.animate(withDuration: animationDuration) {
            self.continueBottomConstraint.constant = self.keyboardHeight + 20
            self.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let info = notification.userInfo,
              let animationDuration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        keyboardHeight = 0
        UIView.animate(withDuration: animationDuration) {
            self.continueBottomConstraint.constant = 20
            self.layoutIfNeeded()
        }
    }
    
    func configure(_ model: InputUIModel) {
        questionLabel.text =  model.questionLabel
    }
    @IBAction func continueTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        onContinueTapped?(nameTextField.text ?? "")
    }
    
    func focusTextField() {
        nameTextField.becomeFirstResponder()
    }
}

extension InputView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let view = touch.view, view.isDescendant(of: continueButton) {
            return false
        }
        return true
    }
}
