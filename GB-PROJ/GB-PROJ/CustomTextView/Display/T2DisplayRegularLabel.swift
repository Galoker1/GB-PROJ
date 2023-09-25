//
//  T2DisplayRegularLabel.swift
//  GB-PROJ
//
//  Created by aaa on 25/09/2023.
//

import SwiftUI

struct T2DisplayRegularLabel: View {
    var textLabel: String
    var color: Color
    
    init(textLabel: String, color: Color = .black) {
        self.textLabel = textLabel
        self.color = color
    }
    
    var body: some View {
        Text(LocalizedStringKey(textLabel))
            .font(.T2DisplayRegular())
            .foregroundColor(color)
    }
}

struct T2DisplayRegularLabel_Previews: PreviewProvider {
    static var previews: some View {
        T2DisplayRegularLabel(textLabel: "This is a custom text label.")
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
