//
//  SearchView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var selectedGenres: [String] = []
    @State private var selectedCountry: [String] = []
    @State private var selectedYears: [String] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {

            CustomTextTextLabel(textLabel: "Жанр",
                                color: .white,
                                style: .T2TextSemibold)
            .padding(.horizontal, 8)

            CustomPickerView(placeholder: "Любой жанр", selectedProperties: $selectedGenres, enumCases: ChoseGenre.allCases)
            Spacer().frame(height: 6)

            CustomTextTextLabel(textLabel: "Страна",
                                color: .white,
                                style: .T2TextSemibold)
            .padding(.horizontal, 8)

            CustomPickerView(placeholder: "Любая страна", selectedProperties: $selectedCountry, enumCases: ChoseCountry.allCases)
            Spacer().frame(height: 6)

            CustomTextTextLabel(textLabel: "Год",
                                color: .white,
                                style: .T2TextSemibold)
            .padding(.horizontal, 8)

            CustomPickerView(placeholder: "Любой год", selectedProperties: $selectedYears, enumCases: ChoseYears.allCases)
            Spacer().frame(height: 20)
            WideBlueButton(buttonText: "Поиск") {
                performSearch()
            }
        }
        .padding(.all, 16)
        .background(Color.Neutral.num3)
    }

    private func performSearch() {
        //выполнить поиск на основе выбранных свойств selectedGenres, selectedYears и selectedRatings
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
//struct SearchView: View {
//    @State private var selectedGenres: [String] = []
//    @State private var selectedYears: [String] = []
//    @State private var selectedRatings: [String] = []
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            
//            CustomTextTextLabel(textLabel: "Жанр",
//                                color: .white,
//                                style: .T2TextSemibold)
//            .padding(.horizontal, 8)
//            
//            CustomPickerView(placeholder: "Любой жанр", selectedProperties: $selectedGenres)
//            Spacer().frame(height: 6)
//            
//            CustomTextTextLabel(textLabel: "Страна",
//                                color: .white,
//                                style: .T2TextSemibold)
//            .padding(.horizontal, 8)
//            
//            CustomPickerView(placeholder: "Любая страна", selectedProperties: $selectedYears)
//            Spacer().frame(height: 6)
//            
//            CustomTextTextLabel(textLabel: "Год",
//                                color: .white,
//                                style: .T2TextSemibold)
//            .padding(.horizontal, 8)
//            
//            CustomPickerView(placeholder: "Любой год", selectedProperties: $selectedRatings)
//            Spacer().frame(height: 20)
//            WideBlueButton(buttonText: "Поиск") {
//                performSearch()
//            }
//        }
//        .padding(.all, 16)
//        .background(Color.Neutral.num3)
//    }
//    
//    private func performSearch() {
//        //выполнить поиск на основе выбранных свойств selectedGenres, selectedYears и selectedRatings
//    }
//}
