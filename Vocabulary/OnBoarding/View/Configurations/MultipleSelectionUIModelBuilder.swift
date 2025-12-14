//
//  MultipleSelectionUIModelBuilder.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//


final class MultipleSelectionUIModelBuilder {
    
    private var questionText: String = ""
    private var inputData: String = ""
    private var selectionData: [SelectionUIModel] = []
    private var questionTypes: QuestionTypes = .age
    
    init() {}
    
    func setQuestionText(_ text: String) -> MultipleSelectionUIModelBuilder {
        self.questionText = text
        return self
    }
    
    func setInputData(_ text: String) -> MultipleSelectionUIModelBuilder {
        self.inputData = text
        return self
    }
    
    func setSelectionData(_ data: [SelectionUIModel]) -> MultipleSelectionUIModelBuilder {
        self.selectionData = data
        return self
    }
    
    func setQuestionType(questionType: QuestionTypes) -> MultipleSelectionUIModelBuilder {
        self.questionTypes = questionType
        return self
    }
    
    func build() -> MultipleSelectionUIModel {
        return MultipleSelectionUIModel(
            questionText: questionText,
            inputData: inputData,
            selectionData: selectionData,
            questionType: questionTypes
        )
    }
}
