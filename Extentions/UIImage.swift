//
//  UIImage.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension UIImageView {
    func makeCircular() {
        self.layoutIfNeeded() 
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
}
