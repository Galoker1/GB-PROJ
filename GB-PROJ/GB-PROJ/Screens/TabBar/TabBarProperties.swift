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
            "film"
        case .seriesCatalog:
            "film.stack"
        case .personCatalog:
            "person"
        }
    }
    var tabBarTitle: String {
        switch self {
        case .moviesCatalog:
            "Каталог фильмов"
        case .seriesCatalog:
            "Каталог сериалов"
        case .personCatalog:
            "Персональный каталог"
        }
    }
}
