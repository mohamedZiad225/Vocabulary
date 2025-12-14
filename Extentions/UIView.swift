//
//  UIView.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

extension UIView {
    static func fromNib<T: UIView>() -> T {
        let nibName = String(describing: T.self)
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? T else {
            fatalError("Could not load view from nib \(nibName)")
        }
        return view
    }
}
