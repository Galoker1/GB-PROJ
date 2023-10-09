//
//  CustomHeaderView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

struct CustomHeaderView: View {
    @State private var isSearchViewVisible = false
    var textLabel: String

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
            SearchView()
                .frame(maxHeight: .infinity)
                .background(Color.Neutral.num2)
                .presentationDetents([.medium])
              
        }
    }
}


