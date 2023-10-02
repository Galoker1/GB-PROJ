//
//  DescriptionMovieView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI

struct DescriptionMovieView: View {
    //TODO: - сделать имена фильмов с заглавных, так смотриться эстетичнее
    var titleFilm: String = "ГИПНОТИК"
    var rating: String =  "4"
    var age: String = "2016"
    var genre: String = "Драма"
    var shortDiscription: String = "История жизни Рэя Крока, человека создавшего самую известную в мире сеть ресторанов быстрого обслуживания"
//    var : String
//    var : String
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
 
                DescriptionAndRatingView(rating: rating, age: age, genre: genre, shortDiscription: shortDiscription)
                .padding(.top, 10)
                .padding(.horizontal, 20)
                
                WideSaveShareButtonsView(titleFilm: titleFilm, appLink: "Ссылка на фильм")
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
