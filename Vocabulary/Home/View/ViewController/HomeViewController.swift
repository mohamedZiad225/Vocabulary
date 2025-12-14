//
//  HomeViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import UIKit

class HomeViewController: UIViewController {
    //    MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    //    MARK: - Properties
    var viewModel: HomeViewModel!
    var vocabList: [VocabWordsUIModel] = []
    var tutorialSteps: [() -> Void] = []
    var currentIndex: Int = 0
    let generator = UIImpactFeedbackGenerator(style: .light)
    private var loopedVocabList: [VocabWordsUIModel] = []
    private let uiMapper = WordsUIMapper()
//  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupText()
        setupButtons()
        registerCollectionViewCell()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard !TutorialStorage.hasSeen(.home) else { return }
        showProfileTutorial()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupLayout() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.itemSize = UIScreen.main.bounds.size
        collectionView.collectionViewLayout = layout
        collectionView.showsVerticalScrollIndicator =  false
    }
    
    private func setupButtons() {
        settingsButton.backgroundColor = .gray.withAlphaComponent(0.5)
        settingsButton.tintColor = .black
        settingsButton.makeCircular()
        profileButton.backgroundColor = .gray.withAlphaComponent(0.5)
        profileButton.tintColor = .black
        profileButton.makeCircular()
    }
    
    private func setupText() {
        nameLabel.text = "Hello \(viewModel.getProfileData()?.name ?? "")"
        nameLabel.font = UIFont.italicSystemFont(ofSize: 15)
    }
    
    private func registerCollectionViewCell() {
        collectionView.register(
            UINib(nibName: "HomeCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "HomeCollectionViewCell"
        )
    }
    
    private func loadData() {
        vocabList = uiMapper.transformWords().list
        collectionView.reloadData()
    }
    
    @IBAction func didTapProfileButton(_ sender: Any) {
        viewModel.navigateToProfile()
        generator.impactOccurred()
    }
    
    @IBAction func didTapSettingsButton(_ sender: Any) {
        viewModel.navigateToSettings()
        generator.impactOccurred()
    }
}
//    MARK: - Tutorial
private extension HomeViewController {
    
    func showProfileTutorial() {
        let overlay = TutorialOverlayView(
            targetView: profileButton,
            message: "Tap here to view your profile"
        )
        overlay.nextStep = { [weak self] in
            guard let self = self else {return}
            self.showSettingsTutorial()
        }
        view.addSubview(overlay)
    }
    func showSettingsTutorial() {
        let overlay = TutorialOverlayView(
            targetView: settingsButton,
            message: "Tap here to change your settings"
        )
        overlay.nextStep = { [weak self] in
            guard let self = self else {return}
            self.showScrollTutorial()
        }
        view.addSubview(overlay)
    }
    
    func showListeningTutorial() {
        let indexPath = IndexPath(item: 0, section: 0)
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell else {return}
        let overlay = TutorialOverlayView(
            targetView: cell.accessibilityButton,
            message: "Click here to listen"
        )
        TutorialStorage.markSeen(.home)
        view.addSubview(overlay)
    }

    func showScrollTutorial() {
        let overlay = SwipeTutorialOverlay(
            targetView: collectionView,
            message: "Swipe up to browse words"
        )
        overlay.nextStep = { [weak self] in
            guard let self = self else {return}
            showListeningTutorial()
        }
        view.addSubview(overlay)
    }
}
