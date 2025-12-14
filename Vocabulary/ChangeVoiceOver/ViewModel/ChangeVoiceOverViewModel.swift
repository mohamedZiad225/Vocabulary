//
//  ChangeVoiceOverViewModel.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

final class ChangeVoiceOverViewModel {
    private let router: ChangeVoiceOverRouterProtocol
    
    // MARK: - Properties
    private(set) var voices: [VoiceUIModel] = []
    private(set) var selectedVoiceId: String?
    private var originalVoiceId: String?
    
    var selectedVoiceIndex: Int? {
        return voices.firstIndex { $0.identifier == selectedVoiceId }
    }
    
    // MARK: - Init
    init(router: ChangeVoiceOverRouterProtocol) {
        self.router = router
        originalVoiceId = SpeachManager.shared.selectedVoiceIdentifier
        selectedVoiceId = originalVoiceId
    }
    
    // MARK: - Public Methods
    func loadVoices() {
        voices = SpeachManager.shared.availableEnglishVoices()
        selectedVoiceId = SpeachManager.shared.selectedVoiceIdentifier
    }
    
    func selectVoice(at index: Int) {
        let voice = voices[index]
        selectedVoiceId = voice.identifier
        SpeachManager.shared.speak("This is how I will sound", voiceIdentifier: voice.identifier)
    }
    
    func resetToOriginalVoice() {
        selectedVoiceId = originalVoiceId
        SpeachManager.shared.selectedVoiceIdentifier = originalVoiceId
    }
    
    func confirmSelection() {
        SpeachManager.shared.selectedVoiceIdentifier = selectedVoiceId
    }
    
    // MARK: - Navigation
    func navigateBack() {
        SpeachManager.shared.stopSpeaking()
        router.pop()
    }
    
    func navigateToRoot() {
        SpeachManager.shared.stopSpeaking()
        router.popToRoot()
    }
}
