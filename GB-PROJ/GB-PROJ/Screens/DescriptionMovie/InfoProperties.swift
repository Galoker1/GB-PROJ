//
//  InfoProperties.swift
//  GB-PROJ
//
//  Created by Александра Макей on 03.10.2023.
//

import Foundation


enum InfoProperties {
    case info, rating, releaseYear, genre, ageLimit, shortDiscription, discription, country, language, duration
    
    
    var title: String {
        switch self {
        case .info:
            return "Информация"
        case .rating:
            return ""
        case .releaseYear:
            return "Год производства"
        case .genre:
            return "Жанр"
        case .ageLimit:
            return "Возрастное ограничение"
        case .shortDiscription:
            return ""
        case .discription:
            return "Сюжет"
        case .country:
            return "Страна"
        case .language:
            return "Язык"
        case .duration:
            return "Продолжительность"
        }
    }
}
