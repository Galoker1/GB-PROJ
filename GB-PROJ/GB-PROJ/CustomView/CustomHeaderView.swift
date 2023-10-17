//
//  CustomHeaderView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

struct CustomHeaderView: View {
    @State private var isSearchViewVisible = false
    var searchFunc: ((String) -> Void)? = nil
    var textLabel: String
    
    @State private var larger = true
    
    
    var body: some View {
        HStack {
            CustomDisplayTextLabel(textLabel: textLabel,
                                   color: Color.Primary.num1,
                                   style: .T1DisplaySemibold)
            Spacer()
            Button(action: {
                isSearchViewVisible.toggle()
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.Primary.num1)
            }
        }
        .sheet(isPresented: $isSearchViewVisible) {

            SearchView(searchFunc: searchFunc)
                .frame(maxHeight: .infinity)
                .background(Color.Neutral.num2)
                .presentationDetents([.medium])
            
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                .animation(Animation.easeInOut(duration: 0.5))
                .background(Color.Neutral.num2)
        }
    }
}


