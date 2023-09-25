//
//  T1DisplaySemiboldLabel.swift
//  GB-PROJ
//
//  Created by aaa on 25/09/2023.
//

import SwiftUI

struct T1DisplaySemiboldLabel: View {
    var textLabel: String
    var color: Color
    
    init(textLabel: String, color: Color = .black) {
        self.textLabel = textLabel
        self.color = color
    }
    
    var body: some View {
        Text(LocalizedStringKey(textLabel))
            .font(.T1DisplaySemibold())
            .foregroundColor(color)
    }
}

struct T1DisplaySemiboldLabel_Previews: PreviewProvider {
    static var previews: some View {
        T1DisplaySemiboldLabel(textLabel: "This is a custom text label.")
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

