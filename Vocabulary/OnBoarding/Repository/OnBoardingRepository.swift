//
//  OnBoardingRepository.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

protocol OnBoardingRepositoryProtocol {
    func saveProfile(_ profile: ProfileUIModel)
}

final class OnBoardingRepository: OnBoardingRepositoryProtocol {
    private let userDefaults = UserDefaults.standard
    private let key = "user_profile"
    
    func saveProfile(_ profile: ProfileUIModel) {
        do {
            let data = try JSONEncoder().encode(profile)
            userDefaults.set(data, forKey: key)
        } catch {
            print("Failed to save profile: \(error)")
        }
    }
}
