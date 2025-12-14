//
//  WelcomeRouter.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

final class WelcomeRouter: WelcomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func goToOnboarding() {
        let onBoardingVC = OnBoardingViewController(
            nibName: "OnBoardingViewController",
            bundle: nil
        )
        let repository = OnBoardingRepository()
        let viewModel = OnBoardingViewModel(router: OnBoardingRouter(viewController: onBoardingVC), repository: repository)
        onBoardingVC.viewModel = viewModel
        onBoardingVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(onBoardingVC, animated: true)
    }
}
