//
//  ChoseCountry.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import Foundation

//enum ChoseCountry: String, CaseIterable, ChosePickersProperties {
//    case usa = "USA"
//    case russia = "Russia"
//    case france = "France"
//    case uk = "UK"
//    case germany = "Germany"
//
//
//    var russianName: String {
//        switch self {
//            case .usa: return "США"
//            case .russia: return "Россия"
//            case .france: return "Франция"
//            case .uk: return "Великобритания"
//            case .germany: return "Германия"
//          
//        }
//    }
//}

enum ChoseCountry: String, CaseIterable, ChosePickersProperties {
    case usa = "USA"
    case russia = "Russia"
    case france = "France"
    case uk = "UK"
    case germany = "Germany"
    case italy = "Italy"
    case china = "China"
    case japan = "Japan"
    case india = "India"
    case southKorea = "South Korea"
    case brazil = "Brazil"
    case mexico = "Mexico"
    case canada = "Canada"
    case australia = "Australia"
    case spain = "Spain"
    case argentina = "Argentina"
    case sweden = "Sweden"
    case denmark = "Denmark"
    case norway = "Norway"
    case finland = "Finland"

    var russianName: String {
        switch self {
            case .usa: return "США"
            case .russia: return "Россия"
            case .france: return "Франция"
            case .uk: return "Великобритания"
            case .germany: return "Германия"
            case .italy: return "Италия"
            case .china: return "Китай"
            case .japan: return "Япония"
            case .india: return "Индия"
            case .southKorea: return "Южная Корея"
            case .brazil: return "Бразилия"
            case .mexico: return "Мексика"
            case .canada: return "Канада"
            case .australia: return "Австралия"
            case .spain: return "Испания"
            case .argentina: return "Аргентина"
            case .sweden: return "Швеция"
            case .denmark: return "Дания"
            case .norway: return "Норвегия"
            case .finland: return "Финляндия"
        }
    }
}
