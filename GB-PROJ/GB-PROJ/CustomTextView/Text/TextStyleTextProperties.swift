//
//  TextStyleTextProperties.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

enum TextStyleTextProperties {
    case T1TextSemibold
    case T2TextRegular
    case T3TextSemibold
    case T4TextRegular
    
    var font: Font {
        switch self {
        case .T1TextSemibold:
            return .T1TextSemibold()
        case .T2TextRegular:
            return .T2TextRegular()
        case .T3TextSemibold:
            return .T3TextSemibold()
        case .T4TextRegular:
            return .T4TextRegular()
        }
    }
}
