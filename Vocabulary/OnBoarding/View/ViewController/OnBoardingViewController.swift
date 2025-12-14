//
//  OnBoardingViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 11/12/2025.
//

import UIKit

class OnBoardingViewController: UIViewController {
    //    MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
//    MARK: - Properties
    var viewModel: OnBoardingViewModel!
    var onBoardingData: [OnBoardingItem] = []
    let generator = UIImpactFeedbackGenerator(style: .medium)
    private var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
// MARK: - Setup
private extension OnBoardingViewController {
    
    func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
    }
    
    func setupViews() {
        viewModel.onBoardingItems.forEach { addOnBoardingView(for: $0) }
    }
    
    func addOnBoardingView(for item: OnBoardingItem) {
        let viewToAdd: UIView

        switch item {
        case .statement(let model):
            viewToAdd = makeStatementView(model)
            
        case .multipleSelection(let model):
            viewToAdd = makeMultipleSelectionView(model)
            
        case .input(let model):
            viewToAdd = makeInputView(model)
        }

        addViewToStack(viewToAdd)
    }

    // MARK: - Private Helpers
    private func makeStatementView(_ model: StatmentUIModel) -> UIView {
        let statementView = OnBoardingStatementView()
        statementView.configure(model)
        statementView.continueButton.addTarget(self, action: #selector(didTapContinue(_:)), for: .touchUpInside)
        return statementView
    }

    private func makeMultipleSelectionView(_ model: MultipleSelectionUIModel) -> UIView {
        let multiView = MultipleSelectionView()
        multiView.configure(model)
        multiView.didSelectItem = { [weak self] selectedOption in
            guard let self = self else { return }
            self.updateProfile(for: model.questionType, with: selectedOption.selectionText)
            self.goToNextPage()
            self.generator.impactOccurred()
        }
        return multiView
    }

    private func makeInputView(_ model: InputUIModel) -> UIView {
        let inputView = InputView()
        inputView.configure(model)
        inputView.onContinueTapped = { [weak self] name in
            guard let self = self else { return }
            self.viewModel.setName(name)
            self.goToNextPage()
            self.generator.impactOccurred()
        }
        return inputView
    }

    private func updateProfile(for questionType: QuestionTypes, with value: String) {
        switch questionType {
        case .howDidYouHear: viewModel.setHowDidHeHear(value)
        case .age: viewModel.setAge(value)
        case .gender: viewModel.setGender(value)
        case .level: viewModel.setVocabLevel(value)
        case .howManyWords: viewModel.setWordsPerWeek(value)
        case .name: break
        }
    }

    
    func addViewToStack(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}

// MARK: - Actions
private extension OnBoardingViewController {
    
    @objc func didTapContinue(_ sender: UIButton) {
        generator.impactOccurred()
        goToNextPage()
    }
    
    func goToNextPage() {
        generator.impactOccurred()
        pageIndex += 1
        
        guard pageIndex < stackView.arrangedSubviews.count else {
            viewModel.finishOnboarding()
            return
        }
        
        let offset = CGPoint(x: scrollView.frame.width * CGFloat(pageIndex), y: 0)
        scrollView.setContentOffset(offset, animated: true)
        
        let currentView = stackView.arrangedSubviews[pageIndex]
        if let inputView = currentView as? InputView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                inputView.focusTextField()
            }
        }
    }
}
                                          
