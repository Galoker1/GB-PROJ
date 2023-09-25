//
//  LogoElementView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct LogoElementView: View {
    
    @Binding var logoOpacity: Double
    @Binding var labelOpacity: Double

    var body: some View {
        VStack(spacing: 10) {
            Image( "LogoPNG")
                .resizable()
                .frame(width: 300, height: 300)
                .opacity(logoOpacity)
                .cornerRadius(150)
            LogoBodyLabel(textLabel: "By. Aliaksandra Makey\nEgor Khlyamov\nDias Atudinov")
                .frame(width: 400, height: 100)
                .padding(.trailing, -150)
                .opacity(labelOpacity)
        }
    }
}

struct LogoElementView_Previews: PreviewProvider {
    static var previews: some View {
        LogoElementView(logoOpacity: .constant(1), labelOpacity: .constant(1))
    }
}
