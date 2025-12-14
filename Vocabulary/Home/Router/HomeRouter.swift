//
//  HomeRouter.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func goToProfile() {
        let profileVC = ProfileViewController(
            nibName: "ProfileViewController",
            bundle: nil
        )
        let repository = ProfileRepository()
        let viewModel = ProfileViewModel(router: ProfileRouter(viewController: profileVC), repository: repository)
        profileVC.viewModel = viewModel
        
        profileVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func goToSettings() {
        let settingsVC = SettingsViewController(
            nibName: "SettingsViewController",
            bundle: nil
        )
        let viewModel = SettingsViewModel(router: SettingsRouter(viewController: settingsVC))
        settingsVC.viewModel = viewModel
        
        settingsVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(settingsVC, animated: true)
    }
}
