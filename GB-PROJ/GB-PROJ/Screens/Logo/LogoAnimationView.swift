//
//  LogoAnimationView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct LogoAnimationView: View {
    
    @State private var logoOpacity: Double = 0
    @State private var labelOpacity: Double = 0
    @State private var linePosition = CGSize(width: -200, height: 100)
    // статус показов
    @State private var blurIsShown: Bool = true
    @State private var showLogo: Bool = true
    @State private var showMainView: Bool = false
    // цвет
    let lineColor = Color.Neutral.num4
    let shadowColor = Color.Neutral.num4
    
    var body: some View {
        ZStack {
            if !showMainView {
                Line(from: CGPoint(x: -200, y: 100), to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                    .shadow(color: shadowColor, radius: 500, x: -70, y: -70)
                    .offset(linePosition)
                    .onAppear {
                        // анимация линии
                        withAnimation(.easeInOut(duration: 1.7).delay(1)) {
                            linePosition = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        }
                    }
            }
            
            if blurIsShown {
                VisualEffectBlur(blurStyle: .systemMaterial)
            }
            if showLogo {
                LogoElementView(logoOpacity: $logoOpacity, labelOpacity: $labelOpacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.5).delay(1)) {
                            logoOpacity = 1
                            labelOpacity = 1
                        }
                    }
            }
            if showMainView {
                TabBarView()
                    .transition(.opacity)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.7)) {
                    blurIsShown = false
                    showLogo = false
                    showMainView = true
                }
            }
        }
        .background(Color.Neutral.num3)
    }
}


struct LogoAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LogoAnimationView()
    }
}

