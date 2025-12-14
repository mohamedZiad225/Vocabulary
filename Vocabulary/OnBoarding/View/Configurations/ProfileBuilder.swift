//
//  ProfileBuilder.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//


final class ProfileBuilder {
    private var profile = ProfileUIModel()
    
    @discardableResult
    func setHowDidHeHear(_ value: String) -> ProfileBuilder {
        profile.howDidHeHear = value
        return self
    }
    
    @discardableResult
    func setAge(_ value: String) -> ProfileBuilder {
        profile.age = value
        return self
    }
    
    @discardableResult
    func setGender(_ value: String) -> ProfileBuilder {
        profile.gender = value
        return self
    }
    
    @discardableResult
    func setVocabLevel(_ value: String) -> ProfileBuilder {
        profile.vocabLevel = value
        return self
    }
    
    @discardableResult
    func setWordsPerWeek(_ value: String) -> ProfileBuilder {
        profile.wordsPerWeek = value
        return self
    }
    
    @discardableResult
    func setName(_ value: String) -> ProfileBuilder {
        profile.name = value
        return self
    }
    
    @discardableResult
    func build() -> ProfileUIModel {
        return profile
    }
}
