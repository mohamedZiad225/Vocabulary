//
//  TutorialStorage.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

struct TutorialStorage {
    static func hasSeen(_ tutorial: AppTutorial) -> Bool {
        UserDefaults.standard.bool(forKey: tutorial.key)
    }
    
    static func markSeen(_ tutorial: AppTutorial) {
        UserDefaults.standard.set(true, forKey: tutorial.key)
    }
}
