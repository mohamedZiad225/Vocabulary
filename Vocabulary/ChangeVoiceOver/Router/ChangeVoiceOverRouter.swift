//
//  ChangeVoiceOverRouter.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

final class ChangeVoiceOverRouter: ChangeVoiceOverRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
}
