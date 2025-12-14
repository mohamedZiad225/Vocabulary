//
//  VocabWordsUIModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import Foundation

struct VocabWordsUIModel {
    let word: String
    let description: String
    let id = UUID()
    
}

struct VocabListUIModel {
    let list: [VocabWordsUIModel]
}


