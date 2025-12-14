//
//  UIButton.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import UIKit
extension UIButton {
    
    func makeCircular() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
