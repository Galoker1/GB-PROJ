//
//  TabBarProperties.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

enum TabBarProperties: String, CaseIterable {
    case moviesCatalog
    case seriesCatalog
    case personCatalog
    
    var tabImage: String {
        switch self {
        case .moviesCatalog:
            return "film"
        case .seriesCatalog:
            return "film.stack"
        case .personCatalog:
            return "person"
        }
    }
    var tabBarTitle: String {
        switch self {
        case .moviesCatalog:
            return "Каталог фильмов"
        case .seriesCatalog:
            return "Каталог сериалов"
        case .personCatalog:
            return "Персональный каталог"
        }
    }
}
