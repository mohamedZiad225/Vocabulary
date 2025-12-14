//
//  WordsUIMapper.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import Foundation

struct WordsUIMapper {
    func transformWords() -> VocabListUIModel {
        let baseList: [VocabWordsUIModel] = [
            VocabWordsUIModel(word: "equanimous", description: "(adj.) Calm and in control of emotions"),
            VocabWordsUIModel(word: "indolent", description: "(adj.) Unmotivated or not trying"),
            VocabWordsUIModel(word: "ameliorate", description: "(v.) To make a bad situation better"),
            VocabWordsUIModel(word: "reticence", description: "(noun.) Being quiet and not sharing thoughts easily"),
            VocabWordsUIModel(word: "petulant", description: "(adj.) Easily annoyed or irritated, especially when things don’t go your way")
        ]
        
        var repeatedList: [VocabWordsUIModel] = []
        while repeatedList.count < 50 {
            repeatedList.append(contentsOf: baseList)
        }
        repeatedList = Array(repeatedList.prefix(50))
        
        return VocabListUIModel(list: repeatedList)
    }
}

