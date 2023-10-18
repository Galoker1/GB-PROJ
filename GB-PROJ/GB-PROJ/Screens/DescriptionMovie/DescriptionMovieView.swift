//
//  DescriptionMovieView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI

struct DescriptionMovieView: View {
    let viewFilm: ViewFilm
    
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
                    if let posterImage = viewFilm.poster {
                        Image(uiImage: posterImage)
                                              .resizable()
                                              .aspectRatio(contentMode: .fill)
                                              .frame(height: 500)
                    } else {
                            ProgressView()
                                .frame(width: UIScreen.main.bounds.width,  height: 500)

                    }
                    GradientView()
                        .frame(height: 300)
                        .padding(.bottom, -300)
                }
                Spacer()
                CustomDisplayTextLabel(textLabel: viewFilm.name,
                                       color: .white,
                                       style: .T1DisplaySemibold)
                Divider()
 
                InfoAndRatingView(rating: String(viewFilm.imdbEating),
                                  releaseYear: String(viewFilm.year),
                                  genre: viewFilm.genres,
                                  shortDiscription: viewFilm.description)
                .padding(.top, 10)
                .padding(.horizontal, 20)
                
                WideSaveShareButtonsView(titleFilm: titleFilm, appLink: "Ссылка на фильм", film: viewFilm)
                    .padding(.horizontal, 16)
                 
                  
                InfoMovieView(releaseYear: String(viewFilm.year),
                              ageLimit: ageLimit,
                              genre: viewFilm.genres,
                              discription: viewFilm.description,
                              country: viewFilm.countries,
                              language: language,
                              duration: String(viewFilm.movieLength))
                .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.Neutral.num3)
    }
}
