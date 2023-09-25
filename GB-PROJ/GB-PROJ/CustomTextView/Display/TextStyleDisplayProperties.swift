//
//  TextStyleDisplayProperties.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

enum TextStyleDisplayProperties {
    case T1DisplaySemibold
    case T2DisplayRegular
    case T3DisplaySemibold
    case T4DisplayRegular
    
    var font: Font {
        switch self {
        case .T1DisplaySemibold:
            return .T1DisplaySemibold()
        case .T2DisplayRegular:
            return .T2DisplayRegular()
        case .T3DisplaySemibold:
            return .T3DisplaySemibold()
        case .T4DisplayRegular:
            return .T4DisplayRegular()
        }
    }
}
