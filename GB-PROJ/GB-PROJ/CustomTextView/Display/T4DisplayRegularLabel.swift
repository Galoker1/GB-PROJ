//
//  T4DisplayRegularLabel.swift
//  GB-PROJ
//
//  Created by aaa on 25/09/2023.
//

import SwiftUI

struct T4DisplayRegularLabel: View {
    var textLabel: String
    var color: Color
    
    init(textLabel: String, color: Color = .black) {
        self.textLabel = textLabel
        self.color = color
    }
    
    var body: some View {
        Text(LocalizedStringKey(textLabel))
            .font(.T4DisplayRegular())
            .foregroundColor(color)
    }
}

struct T4DisplayRegularLabel_Previews: PreviewProvider {
    static var previews: some View {
        T4DisplayRegularLabel(textLabel: "This is a custom text label.")
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
