//
//  SettingsRouter.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

final class SettingsRouter: SettingsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func goToVoiceOver() {
        let changeVoiceOverVC = ChangeVoiceOverViewController(
            nibName: "ChangeVoiceOverViewController",
            bundle: nil
        )
        let viewModel = ChangeVoiceOverViewModel(router: ChangeVoiceOverRouter(viewController: changeVoiceOverVC))
        changeVoiceOverVC.viewModel = viewModel
        
        changeVoiceOverVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(changeVoiceOverVC, animated: true)
    }
}
