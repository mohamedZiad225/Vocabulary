//
//  SelectionUIModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//


struct SelectionUIModel: Equatable {
    let selectionText: String
}

enum QuestionTypes {
    case gender
    case name
    case age
    case howDidYouHear
    case level
    case howManyWords
}
