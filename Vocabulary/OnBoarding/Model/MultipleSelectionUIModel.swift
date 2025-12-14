//
//  MultipleSelectionUIModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//


struct MultipleSelectionUIModel: Equatable {
    let questionText: String
    let inputData: String
    let selectionData: [SelectionUIModel]
    let questionType: QuestionTypes
    
    static func == (lhs: MultipleSelectionUIModel, rhs: MultipleSelectionUIModel) -> Bool {
        return lhs.questionText == rhs.questionText &&
        lhs.inputData == rhs.inputData &&
        lhs.selectionData == rhs.selectionData &&
        lhs.questionType == rhs.questionType
    }
}
