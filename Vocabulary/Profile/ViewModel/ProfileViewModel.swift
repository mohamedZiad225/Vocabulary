//
//  ProfileViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

final class ProfileViewModel {
    private let router: ProfileRouterProtocol
    private let repository: ProfileRepositoryProtocol
    var profile: [ProfileDetailsUIModel] = []
    var sections: [ProfileSectionUIModel] = []
    init(router: ProfileRouterProtocol, repository: ProfileRepositoryProtocol) {
        self.router = router
        self.repository = repository
        getProfileData()
    }
    
    func getProfileData() {
        guard let savedProfile = repository.getProfile() else {return}
        self.profile = ProfileUIMapper().transformDataToUIModel(savedProfile)
        self.sections =  ProfileUIMapper().buildSections(from: profile)
    }
}
