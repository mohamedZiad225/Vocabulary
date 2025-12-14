//
//  AppTutorial.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//


enum AppTutorial {
    case home
    
    var key: String {
        switch self {
        case .home:
            return "tutorial.home.shown"
        }
    }
}