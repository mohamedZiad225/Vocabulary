//
//  ProfileRepository.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation
protocol ProfileRepositoryProtocol {
    func getProfile() -> ProfileUIModel?
}

final class ProfileRepository: ProfileRepositoryProtocol {
    
    func getProfile() -> ProfileUIModel? {
        guard let data = UserDefaults.standard.data(forKey: "user_profile") else { return nil }
        return try? JSONDecoder().decode(ProfileUIModel.self, from: data)
    }
}
