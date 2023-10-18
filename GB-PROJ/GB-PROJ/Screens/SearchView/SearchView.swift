//
//  SearchView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI
import Combine

struct SearchView: View {
    @State private var selectedGenres: Set<String> = []
    @State private var selectedCountry: Set<String> = []

    @State private var selectedYears: Set<Int> = []
    var searchFunc: ((String) -> Void)? = nil

    @State var nameMovie: String = ""
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 4) {
                CustomTextTextLabel(textLabel: "Название",
                                    color: .white,
                                    style: .T2TextSemibold)
                .padding(.horizontal, 8)
                
                TextField("", text: $nameMovie)
                    .font(Font.T3DisplayRegular())
                    .overlay(
                        Text(!nameMovie.isEmpty ? "": "Любое название")
                            .opacity(0.5)
                            .padding(.trailing, UIScreen.main.bounds.width/1.78)
                    )
                    .foregroundColor(Color.Neutral.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .padding(.horizontal, 6)
                    .font(Font.T3DisplayRegular())
                    .background(Color.Neutral.num1)
                    .cornerRadius(12)
                
                Spacer().frame(height: 6)
                CustomTextTextLabel(textLabel: "Жанр",
                                    color: .white,
                                    style: .T2TextSemibold)
                .padding(.horizontal, 8)
                
                CustomPickerView(placeholder: "Любой жанр", selectedProperties: $selectedGenres, enumCases: ChoseGenre.allCases)
                    .padding(.bottom, 6)
                
                CustomTextTextLabel(textLabel: "Страна",
                                    color: .white,
                                    style: .T2TextSemibold)
                .padding(.horizontal, 8)
                
                CustomPickerView(placeholder: "Любая страна", selectedProperties: $selectedCountry, enumCases: ChoseCountry.allCases)
                    .padding(.bottom, 6)
                
                CustomTextTextLabel(textLabel: "Год",
                                    color: .white,
                                    style: .T2TextSemibold)
                .padding(.horizontal, 8)
                
                CustomYearsPickerView(placeholder: "Любой год", selectedYears: $selectedYears, yearRange: YearRange.allYears())

            

                WideBlueButton(buttonText: "Поиск") {
                    performSearch()
                }
                .frame(height: 40)
                .padding(.top, 20)
            }
            .padding(.all, 16)
            .background(Color.Neutral.num3)
        }
    }
    
    private func performSearch() {
        searchFunc?(nameMovie)
        //выполнить поиск на основе выбранных свойств selectedGenres, selectedYears и selectedRatings
    }
}



//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(searchFunc: sear)
//    }
//}

