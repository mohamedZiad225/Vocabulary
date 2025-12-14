//
//  OnBoardingUIMapper.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import Foundation

struct OnBoardingUIMapper {
    
    // MARK: - Statement
    func createStatement(title: String, image: String) -> StatmentUIModel {
        return StatmentUIModel(image: image, title: title)
    }
    
    // MARK: - Multiple Selection
    func createMultipleSelection(
        questionText: String,
        selectionData: [SelectionUIModel]
    ) -> MultipleSelectionUIModel {
        return MultipleSelectionUIModelBuilder()
            .setQuestionText(questionText)
            .setSelectionData(selectionData)
            .build()
    }
}

