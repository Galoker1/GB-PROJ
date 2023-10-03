//
//  DescriptionMovieView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI

struct DescriptionMovieView: View {
    //TODO: - сделать имена фильмов с заглавных, так смотриться эстетичнее, заменить все строковые на замапоенные обьекты
    var titleFilm: String = "ГИПНОТИК"
    var rating: String =  "4"
    var releaseYear: String = "2016"
    var genre: String = "Драма"
    var ageLimit: String = "18+"
    var shortDiscription: String = "История жизни Рэя Крока, человека создавшего самую известную в мире сеть ресторанов быстрого обслуживания"
    var discription: String = "Всю свою жизнь Рэй Крок (Майкл Китон) был неудачником. Он перепробовал множество занятий: был пианистом в джазовом ансамбле, агентом по продаже недвижимости и вот теперь продаёт миксе..."
    var country: String = "США, Греция"
    var language: String = "Английский, русский"
    var duration: String = "160"
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("movieTest")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 500)
                    GradientView()
                        .frame(height: 300)
                        .padding(.bottom, -300)
                }
                Spacer()
                CustomDisplayTextLabel(textLabel: titleFilm,
                                       color: .white,
                                       style: .T1DisplaySemibold)
                .padding(.leading, -180)
                Divider()
 
                InfoAndRatingView(rating: rating, releaseYear: releaseYear, genre: genre, shortDiscription: shortDiscription)
                .padding(.top, 10)
                .padding(.horizontal, 20)
                
                WideSaveShareButtonsView(titleFilm: titleFilm, appLink: "Ссылка на фильм")
                    .padding(.horizontal, 16)
                 
                  
                InfoMovieView(releaseYear: releaseYear,
                              ageLimit: ageLimit,
                              genre: genre,
                              discription: discription,
                              country: country,
                              language: language,
                              duration: duration)
                .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.Neutral.num3)
    }
}

struct DescriptionMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionMovieView()
    }
}
