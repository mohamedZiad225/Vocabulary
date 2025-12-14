//
//  WelcomeViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//


import Foundation

final class WelcomeViewModel {
    private let router: WelcomeRouterProtocol

    init(router: WelcomeRouterProtocol) {
        self.router = router
    }

    func didTapGetStarted() {
        router.goToOnboarding()
    }
}
