//
//  InputView+TextFieldDelegate.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension InputView: UITextFieldDelegate {

    // Limit text field to max 20 characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 20
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        let hasText = !text.trimmingCharacters(in: .whitespaces).isEmpty
        continueButton.isEnabled = hasText
        continueButton.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
        continueButton.backgroundColor = hasText ? .systemBlue : .systemGray
        continueButton.setTitleColor(.white, for: .normal)
    }
}
