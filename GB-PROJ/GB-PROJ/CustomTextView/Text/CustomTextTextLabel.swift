//
//  CustomTextTextLabel.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct CustomTextTextLabel: View {
    var textLabel: String
    var color: Color
    var style: TextStyleTextProperties
    
    init(textLabel: String, color: Color = .black, style: TextStyleTextProperties) {
        self.textLabel = textLabel
        self.color = color
        self.style = style
    }
    
    var body: some View {
        Text(LocalizedStringKey(textLabel))
            .font(style.font)
            .foregroundColor(color)
    }
}

//struct CustomTextTextLabel_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            CustomTextTextLabel(textLabel: "This is a custom text label.", style: .T1TextSemibold)
////            CustomTextTextLabel(textLabel: "This is a custom text label.", style: .T2TextRegular)
////            CustomTextTextLabel(textLabel: "This is a custom text label.", style: .T3TextSemibold)
////            CustomTextTextLabel(textLabel: "This is a custom text label.", style: .T4TextRegular)
//        }
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
