//
//  OnboardingViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import Foundation

final class OnBoardingViewModel {
    
    private let router: OnBoardingRouterProtocol
    private let factory: OnBoardingFactory
    private let repository: OnBoardingRepositoryProtocol
    var onBoardingItems: [OnBoardingItem] = []
    var profile: ProfileUIModel = ProfileUIModel()
    var builder = ProfileBuilder()
    
    init(router: OnBoardingRouterProtocol, repository: OnBoardingRepositoryProtocol) {
        self.router = router
        self.repository = repository
        self.factory = OnBoardingFactory()
        loadOnBoardingItems()
    }
    
    func finishOnboarding() {
        setProfile()
        router.finishOnboarding()
    }
    
    private func loadOnBoardingItems() {
        onBoardingItems = factory.createOnBoardingItems()
    }
    
    func setHowDidHeHear(_ value: String) {
        builder.setHowDidHeHear(value)
    }
    
    func setAge(_ value: String) {
        builder.setAge(value)
    }
    
    func setGender(_ value: String) {
        builder.setGender(value)
    }
    
    func setVocabLevel(_ value: String) {
        builder.setVocabLevel(value)
    }
    
    func setWordsPerWeek(_ value: String) {
        builder.setWordsPerWeek(value)
    }
    
    func setName(_ value: String) {
        builder.setName(value)
    }
    
    private func setProfile() {
        profile = builder.build()
        repository.saveProfile(profile)
    }
}
