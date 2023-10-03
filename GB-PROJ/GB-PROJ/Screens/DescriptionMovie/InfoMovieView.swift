//
//  InfoMovieView.swift
//  GB-PROJ
//
//  Created by Александра Макей on 03.10.2023.
//

import SwiftUI

struct InfoMovieView: View {
//    @State var rating: String
    @State var releaseYear: String
    @State var ageLimit: String
    @State var genre: String
    @State var discription: String
    @State var country: String
    @State var language: String
    @State var duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomDisplayTextLabel(textLabel: InfoProperties.info.title,
                                   color: .white,
                                   style: .T2DisplayRegular)

            Spacer().frame(height: 20)
                CustomDisplayTextLabel(textLabel: InfoProperties.discription.title,
                                       color: (Color.white.opacity(0.7)),
                                       style: .T3DisplayRegular)
            Spacer().frame(height: 0)
            CustomTextTextLabel(textLabel: discription,
                                color: .white,
                                style: .T3TextSemibold)
               
            Spacer().frame(height: 16)
            HStack {
                
                    InfoDetailRowView(titleOne: InfoProperties.releaseYear.title,
                                      valueOne: releaseYear,
                                      titleTwo: InfoProperties.language.title,
                                      valueTwo: language,
                                      titleThree: InfoProperties.genre.title,
                                      valueThree: genre)
                
                Spacer().frame(width: 20)

                    InfoDetailRowView(titleOne: InfoProperties.country.title,
                                      valueOne: country,
                                      titleTwo: InfoProperties.ageLimit.title,
                                      valueTwo: ageLimit,
                                      titleThree: InfoProperties.duration.title,
                                      valueThree: "\(duration) мин")
            }
        }
        Divider()
            .background(.white)
    }
}


struct InfoMovieView_Previews: PreviewProvider {
    static var previews: some View {
        InfoMovieView(releaseYear: "210", ageLimit: "18+", genre: "222", discription: "Всю свою жизнь Рэй Крок (Майкл Китон) был неудачником. Он перепробовал множество занятий: был пианистом в джазовом ансамбле, агентом по продаже недвижимости и вот теперь продаёт миксе...", country: "США, Греция", language:  "Английский, русский", duration: "116")
            .background(.green)
    }
}
