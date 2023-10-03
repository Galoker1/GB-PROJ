//
//  InfoAndRatingView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 02/10/2023.
//

import SwiftUI

struct InfoAndRatingView: View {
    @State var rating: String
    @State var releaseYear: String
    @State var genre: String
    @State var shortDiscription: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                CustomDisplayTextLabel(textLabel: rating,
                                       color: .white,
                                       style: .T3DisplayRegular)
                Spacer()
                CustomDisplayTextLabel(textLabel: releaseYear,
                                       color: .white,
                                       style: .T3DisplayRegular)
                Spacer()
                CustomDisplayTextLabel(textLabel: genre,
                                       color: .white,
                                       style: .T3DisplayRegular)
            }
            CustomDisplayTextLabel(textLabel: shortDiscription,
                                   color: (Color.white.opacity(0.7)),
                                   style: .T4DisplaySemibold)
                .lineLimit(5)
        }
        Divider()
            .background(.white)
    }
}
