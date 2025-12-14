//
//  HomeViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import Foundation
final class HomeViewModel {
    
    private let router: HomeRouterProtocol
    private let repository: HomeRepositoryProtocol
    
    init(router: HomeRouterProtocol, repository: HomeRepositoryProtocol) {
        self.router = router
        self.repository  = repository
    }
    
    func navigateToSettings() {
        router.goToSettings()
    }
    func navigateToProfile() {
        router.goToProfile()
    }
    
    func getProfileData() -> ProfileUIModel? {
           return repository.getProfile()
       }
}
