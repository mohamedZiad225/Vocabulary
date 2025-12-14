//
//  UIImpactFeedBack.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension UIImpactFeedbackGenerator {
    static func warmUp() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.prepare()
    }
}
