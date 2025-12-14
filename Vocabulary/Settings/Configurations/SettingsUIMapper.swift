//
//  SettingsUIMapper.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

struct SettingsUIMapper {
    
    func transformDataToSettingsUIModel() -> [SettingsSection] {
        return   [SettingsSection(title: "Voice Over", options: [SettingsOption(title: "Change Voice Over", image: "speaker.wave.2")])]
    }
    
}
