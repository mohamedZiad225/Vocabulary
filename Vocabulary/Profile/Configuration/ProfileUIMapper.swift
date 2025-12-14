//
//  ProfileUIMapper.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import Foundation

struct ProfileUIMapper {
    
    func transformDataToUIModel(_ model: ProfileUIModel) -> [ProfileDetailsUIModel]{
        return [ProfileDetailsUIModel(prefrenceImage: "gender-fluid", type: "Gender", description: model.gender ?? ""),
                ProfileDetailsUIModel(prefrenceImage: "challangeIcon", type: "Challange per week", description: model.wordsPerWeek ?? ""),
                ProfileDetailsUIModel(prefrenceImage: "levelIcon", type: "Vocab level", description: model.vocabLevel ?? "")]
    }
    
     func buildSections(from items: [ProfileDetailsUIModel]) -> [ProfileSectionUIModel]  {
        let grouped = Dictionary(grouping: items) { $0.type }
        var sections = [ProfileSectionUIModel]()
        
        sections = grouped.map {
            ProfileSectionUIModel(title: $0.key, rows: $0.value)
        }
        .sorted { $0.title < $1.title }
         return sections
    }
}
