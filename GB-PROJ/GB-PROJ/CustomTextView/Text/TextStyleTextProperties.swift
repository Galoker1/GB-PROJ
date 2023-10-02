//
//  TextStyleTextProperties.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

enum TextStyleTextProperties {
    case T1TextRegular
    case T2TextSemibold
    case T3TextSemibold
    case T4TextRegular
    
    var font: Font {
        switch self {
        case .T1TextRegular:
            return .T1TextRegular()
        case .T2TextSemibold:
            return .T2TextSemibold()
        case .T3TextSemibold:
            return .T3TextSemibold()
        case .T4TextRegular:
            return .T4TextRegular()
        }
    }
}
