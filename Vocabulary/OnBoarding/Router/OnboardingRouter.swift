//
//  OnBoardingRouter.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

final class OnBoardingRouter: OnBoardingRouterProtocol {
    weak var viewController: UIViewController?
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }

    func finishOnboarding() {
        let homeVC = HomeViewController(
            nibName: "HomeViewController",
            bundle: nil
        )
        let repository = HomeRepository()
        let viewModel = HomeViewModel(router: HomeRouter(viewController: homeVC),
                                      repository: repository)
        homeVC.viewModel = viewModel
        
        homeVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.setViewControllers([homeVC], animated: true)
    }
}
