//
//  SearchView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 08.10.2023.
//

import SwiftUI

// не смог грамотно расскидать по файлам и viewModel-ам

struct SearchView: View {
    @StateObject private var viewModel = MainPageViewModel()
    @State var networkManager = NetworkManager.shared
    @State var networkFilms: [Film] = []

    @State private var selectedGenres: Set<String> = []
    @State private var selectedCountry: Set<String> = []
    @State private var selectedYears: Set<String> = []
    // MARK: переменная текста поиска
    @State var nameMovie: String = ""
    
    //MARK: Массив куда хранятся все данные после поиска
    @State var arrayOfSearchedFilms: [ViewFilm] = []
    
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
    }
    
    // MARK: Func загружает данные после поиска
    func loadFilteredData(name: String) {
        networkManager.fetchSearch(name: name) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.networkFilms = data.docs ?? []
                    self.arrayOfSearchedFilms =  ModelsConverter.shared.convertFilm(networkModel: self.networkFilms)
                    MainPageViewModel().filteredFilms = ModelsConverter.shared.convertFilm(networkModel: self.networkFilms)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    private func performSearch() {
        //выполнить поиск на основе выбранных свойств selectedGenres, selectedYears и selectedRatings
        loadFilteredData(name: nameMovie)
    }
    
    
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

