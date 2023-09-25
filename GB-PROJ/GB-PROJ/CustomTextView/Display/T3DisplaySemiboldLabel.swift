//
//  T3DisplaySemiboldLabel.swift
//  GB-PROJ
//
//  Created by aaa on 25/09/2023.
//

import SwiftUI

struct T3DisplaySemiboldLabel: View {
    var textLabel: String
    var color: Color
    
    init(textLabel: String, color: Color = .black) {
        self.textLabel = textLabel
        self.color = color
    }
    
    var body: some View {
        Text(LocalizedStringKey(textLabel))
            .font(.T3DisplaySemibold())
            .foregroundColor(color)
    }
}

struct T3DisplaySemiboldLabel_Previews: PreviewProvider {
    static var previews: some View {
        T3DisplaySemiboldLabel(textLabel: "This is a custom text label.")
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

