//
//  InfoDetailRowView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 03.10.2023.
//

import SwiftUI

struct InfoDetailRowView: View {
    var titleOne: String
    var valueOne: String
    var titleTwo: String
    var valueTwo: String
    var titleThree: String
    var valueThree: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            CustomDisplayTextLabel(textLabel: titleOne,
                                   color: (Color.white.opacity(0.7)),
                                   style: .T3DisplayRegular)
            CustomDisplayTextLabel(textLabel: valueOne,
                                   color: .white,
                                   style: .T3DisplayRegular)
            CustomDisplayTextLabel(textLabel: titleTwo,
                                   color: (Color.white.opacity(0.7)),
                                   style: .T3DisplayRegular)
            CustomDisplayTextLabel(textLabel: valueTwo,
                                   color: .white,
                                   style: .T3DisplayRegular)
            CustomDisplayTextLabel(textLabel: titleThree,
                                   color: (Color.white.opacity(0.7)),
                                   style: .T3DisplayRegular)
            CustomDisplayTextLabel(textLabel: valueThree,
                                   color: .white,
                                   style: .T3DisplayRegular)
        }
    }
}
