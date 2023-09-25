//
//  CustomDisplayTextLabel.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct CustomDisplayTextLabel: View {
    var textLabel: String
    var color: Color
    var style: TextStyleDisplayProperties
    
    init(textLabel: String, color: Color = .black, style: TextStyleDisplayProperties) {
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

struct CustomDisplayTextLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomDisplayTextLabel(textLabel: "This is a custom text label.", style: .T1DisplaySemibold)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
