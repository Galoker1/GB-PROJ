//
//  GradientView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    .init(color: Color.Neutral.num3.opacity(0.1), location: 0),
                    .init(color: Color.Neutral.num3, location: 1)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
