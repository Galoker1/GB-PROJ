//
//  PersonCatalogView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct PersonCatalogView: View {
    @StateObject private var viewModel = MainPageViewModel()
    
    var body: some View {
        VStack {
            CustomHeaderView(textLabel: TabBarProperties.personCatalog.tabBarTitle)
                .padding(.horizontal, 16)
            
            //TODO: - сдела заглушки, как будут отделены фильмы от сериалов, нужно будет запихнуть данные сюда
            List {
                ForEach(viewModel.films, id: \.self) { movie in
                    HStack {
                        Text(movie.name)
                        Spacer()
                        Image(uiImage: movie.poster ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 35)
                    }
                }
            }
        }
        .background(Color.Neutral.num3)
    }
}
