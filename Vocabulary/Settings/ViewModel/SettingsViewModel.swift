//
//  SettingsViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

final class SettingsViewModel {
    private let router: SettingsRouterProtocol
    var settingsData: [SettingsSection] = []
    init(router: SettingsRouterProtocol) {
        self.router = router
        setData()
    }
    
    private func setData() {
        settingsData = SettingsUIMapper().transformDataToSettingsUIModel()
    }
    
    func navigateToChangeVoiceOver() {
        router.goToVoiceOver()
    }
}
