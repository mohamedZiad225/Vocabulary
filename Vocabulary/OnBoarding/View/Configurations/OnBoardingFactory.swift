//
//  OnBoardingFactory.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

struct OnBoardingFactory {
    
    // MARK: - Public Method
    func createOnBoardingItems() -> [OnBoardingItem] {
        [
            howDidYouHearItem(),
            introStatementItem(),
            ageItem(),
            genderItem(),
            nameInputItem(),
            vocabLevelItem(),
            wordsPerWeekItem(),
            finalStatementItem()
        ]
    }
    
    private func howDidYouHearItem() -> OnBoardingItem {
        multipleSelectionItem(
            question: "How did you hear \nabout Vocabulary?",
            options: [
                "App Store",
                "Web search",
                "Friend/family",
                "Facebook",
                "Instagram",
                "TikTok",
                "Other"
            ],
            questionType: .howDidYouHear
        )
    }
    
    private func ageItem() -> OnBoardingItem {
        multipleSelectionItem(
            question: "How old are you?",
            options: [
                "13 to 17",
                "18 to 24",
                "25 to 34",
                "35 to 44",
                "45 to 54",
                "55+"
            ],
            questionType: .age
        )
    }
    
    private func genderItem() -> OnBoardingItem {
        multipleSelectionItem(
            question: "Which option represents \n you best?",
            options: [
                "Female",
                "Male",
                "Other",
                "Prefer not to say"
            ],
            questionType: .gender
        )
    }
    
    private func vocabLevelItem() -> OnBoardingItem {
        multipleSelectionItem(
            question: "What's your vocabulary level?",
            options: [
                "Beginner",
                "Intermediate",
                "Advanced"
            ],
            questionType: .level
        )
    }
    
    private func wordsPerWeekItem() -> OnBoardingItem {
        multipleSelectionItem(
            question: "How many words do you want \nto learn per week?",
            options: [
                "10 words a week",
                "30 words a week",
                "50 words a week"
            ],
            questionType: .howManyWords
        )
    }
    
    
    private func introStatementItem() -> OnBoardingItem {
        statementItem(
            image: "animationLadder",
            title: "Tailor your word \nrecommendations"
        )
    }
    
    private func finalStatementItem() -> OnBoardingItem {
        statementItem(
            image: "Library",
            title: "Set up vocabulary to help you \n achieve your goals"
        )
    }
    
    
    
    private func nameInputItem() -> OnBoardingItem {
        inputItem(
            question: "What is your \n name?"
        )
    }
    
    
    // MARK: - Private Helpers
    
    private func statementItem(image: String, title: String) -> OnBoardingItem {
        .statement(StatmentUIModel(image: image, title: title))
    }
    
    private func multipleSelectionItem(question: String, options: [String], questionType: QuestionTypes) -> OnBoardingItem {
        let selectionModels = options.map { SelectionUIModel(selectionText: $0) }
        let model = MultipleSelectionUIModelBuilder()
            .setQuestionText(question)
            .setSelectionData(selectionModels)
            .setQuestionType(questionType: questionType)
            .build()
        return .multipleSelection(model)
    }
    
    private func inputItem(question: String) -> OnBoardingItem {
        .input(InputUIModel(questionLabel: question))
    }
}
