//
//  ChoseGenre.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import Foundation

enum ChoseGenre: String, CaseIterable, ChosePickersProperties {
    case action = "Action"
    case adventure = "Adventure"
    case animation = "Animation"
    case comedy = "Comedy"
    case crime = "Crime"
    case drama = "Drama"
    case fantasy = "Fantasy"
    case horror = "Horror"
    case mystery = "Mystery"
    case romance = "Romance"
    case scienceFiction = "Science Fiction"
    case thriller = "Thriller"
    case western = "Western"
    case musical = "Musical"
    case documentary = "Documentary"
    case family = "Family"
    case historical = "Historical"
    case war = "War"
    case biographical = "Biographical"
    case sports = "Sports"

    var russianName: String {
        switch self {
            case .action: return "Боевик"
            case .adventure: return "Приключения"
            case .animation: return "Анимация"
            case .comedy: return "Комедия"
            case .crime: return "Криминал"
            case .drama: return "Драма"
            case .fantasy: return "Фэнтези"
            case .horror: return "Ужасы"
            case .mystery: return "Тайна"
            case .romance: return "Романтика"
            case .scienceFiction: return "Научная фантастика"
            case .thriller: return "Триллер"
            case .western: return "Вестерн"
            case .musical: return "Мюзикл"
            case .documentary: return "Документальный"
            case .family: return "Семейный"
            case .historical: return "Исторический"
            case .war: return "Военный"
            case .biographical: return "Биографический"
            case .sports: return "Спортивный"
        }
    }
}

enum ChoseYears: String, CaseIterable, ChosePickersProperties {    
    case twentyFirst, twentySecond, twentyThird, twentyFourth, twentyFifth, twentySixth, twentySeventh, twentyEighth, twentyNinth

    var russianName: String {
        switch self {
         
        case .twentyFirst:
            return "2001"
        case .twentySecond:
            return "2002"
        case .twentyThird:
            return "2003"
        case .twentyFourth:
            return "2004"
        case .twentyFifth:
            return "2005"
        case .twentySixth:
            return "2006"
        case .twentySeventh:
            return "2007"
        case .twentyEighth:
            return "2008"
        case .twentyNinth:
            return "2009"
        default :
            return "2001"
        }
    }
}
