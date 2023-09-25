//
//  Font.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI


extension Font {
    // T1, T2 (T - title)
    static func T1DisplaySemibold() -> Font {
        Font.custom("SF-Pro-Display-Semibold", size: 28)
    }
    static func T2DisplayRegular() -> Font {
        Font.custom("SF-Pro-Display-Regular", size: 24)
    }
    static func T3DisplaySemibold() -> Font {
        Font.custom("SF-Pro-Display-Semibold", size: 17)
    }
    static func T4DisplayRegular() -> Font {
        Font.custom("SF-Pro-Display-Regular", size: 13)
    }
    
    static func LogoBody() -> Font {
        Font.custom("GlacialIndifference-Regular", size: 15)
    }
    
    static func T1TextSemibold() -> Font {
        Font.custom("SF-Pro-Text-Regular", size: 28)
    }
    static func T2TextRegular() -> Font {
        Font.custom("SF-Pro-Text-Semibold", size: 24)
    }
    static func T3TextSemibold() -> Font {
        Font.custom("SF-Pro-Text-Regular", size: 17)
    }
    static func T4TextRegular() -> Font {
        Font.custom("SF-Pro-Text-Semibold", size: 13)
    }

}
