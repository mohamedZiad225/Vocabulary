//
//  SpeachManager.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 12/12/2025.
//

import AVFoundation

final class SpeachManager: NSObject {

    // MARK: - Singleton
    static let shared = SpeachManager()

    // MARK: - Properties
    private let synthesizer = AVSpeechSynthesizer()
    private var isAudioSessionActive = false
    private let queue = DispatchQueue(label: "speech.manager.queue")
    private let selectedVoiceKey = "selected_voice_identifier"
    var selectedVoiceIdentifier: String? {
        get { UserDefaults.standard.string(forKey: selectedVoiceKey) }
        set { UserDefaults.standard.setValue(newValue, forKey: selectedVoiceKey) }
    }


    private override init() {
        super.init()
    }
}

// MARK: - Public API
extension SpeachManager {

    /// Speak the provided text with optional voice and volume
    func speak(_ text: String, volume: Float = 1.0, voiceIdentifier: String? = nil) {
        queue.async { [weak self] in
            guard let self = self else { return }

            if !self.isAudioSessionActive {
                self.activateAudioSession {
                    self.startSpeaking(text, volume: volume, voiceIdentifier: voiceIdentifier)
                }
            } else {
                self.startSpeaking(text, volume: volume, voiceIdentifier: voiceIdentifier)
            }
        }
    }

    /// Stop any ongoing speech immediately
    func stopSpeaking() {
        queue.async { [weak self] in
            self?.synthesizer.stopSpeaking(at: .immediate)
        }
    }

    /// Prepare the speech synthesizer for immediate use without audible output
    func warmUp() {
        queue.async { [weak self] in
            guard let self = self else { return }
            self.activateAudioSession {
                let utterance = AVSpeechUtterance(string: " ")
                utterance.volume = 0
                utterance.rate = 0.1
                self.synthesizer.speak(utterance)
                self.synthesizer.stopSpeaking(at: .immediate)
            }
        }
    }

    /// Returns a list of unique English voices, prioritizing enhanced (human-like) voices
    func availableEnglishVoices() -> [VoiceUIModel] {
        let allEnglishVoices = AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language.hasPrefix("en") }
            .sorted { $0.name < $1.name }

        let enhancedVoices = allEnglishVoices.filter { $0.quality == .enhanced }
        let voicesToUse = enhancedVoices.isEmpty ? allEnglishVoices : enhancedVoices

        var seenNames = Set<String>()
        let uniqueVoices = voicesToUse.filter { voice in
            guard !seenNames.contains(voice.name) else { return false }
            seenNames.insert(voice.name)
            return true
        }

        return uniqueVoices.map {
            VoiceUIModel(identifier: $0.identifier, name: $0.name, language: $0.language)
        }
    }

}

// MARK: - Private Methods
private extension SpeachManager {

    /// Activates AVAudioSession for TTS playback
    func activateAudioSession(completion: @escaping () -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            let session = AVAudioSession.sharedInstance()
            do {
                try session.setCategory(.playback, mode: .spokenAudio)
                try session.setActive(true)
                self.isAudioSessionActive = true
            } catch {
                print("Audio session error: \(error)")
            }

            completion()
        }
    }

    func startSpeaking(_ text: String, volume: Float, voiceIdentifier: String?) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.volume = volume

        if let voiceId = voiceIdentifier ?? selectedVoiceIdentifier,
           let voice = AVSpeechSynthesisVoice(identifier: voiceId) {
            utterance.voice = voice
        }
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
}
