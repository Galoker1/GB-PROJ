//
//  Color.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

extension Color {

   enum Primary {
       static let num1 = Color(#colorLiteral(red: 0.9450980392, green: 0.737254902, blue: 0.4941176471, alpha: 1))
       static let num2 = Color(#colorLiteral(red: 0.3137254902, green: 0.8196078431, blue: 0.3647058824, alpha: 1))
       static let num3 = Color(#colorLiteral(red: 0.3647058824, green: 0.5882352941, blue: 0.9294117647, alpha: 1))
   }

   enum Neutral {
       static let num1 = Color(#colorLiteral(red: 0.3568627451, green: 0.3098039216, blue: 0.4, alpha: 1))
       static let num2 = Color(#colorLiteral(red: 0.2078431373, green: 0.1490196078, blue: 0.2470588235, alpha: 1))
       static let num3 = Color(#colorLiteral(red: 0.06274509804, green: 0.01176470588, blue: 0.1137254902, alpha: 1))
       static let num4 = Color(#colorLiteral(red: 0.03529411765, green: 0.003921568627, blue: 0.09411764706, alpha: 1))
       static let black = Color(#colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1))
       static let gray = Color(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
       static let white = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   }
   
   enum Feedback {
       static let error = Color(#colorLiteral(red: 0.9019607843, green: 0.2745098039, blue: 0.2745098039, alpha: 1))
       static let stars = Color(#colorLiteral(red: 0.9882352941, green: 0.7176470588, blue: 0.1058823529, alpha: 1))
   }
}

