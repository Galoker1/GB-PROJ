//
//  LineShape.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct Line: Shape {
    let from: CGPoint
    let to: CGPoint

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }
    }
}
