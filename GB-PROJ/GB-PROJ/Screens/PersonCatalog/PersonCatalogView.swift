//
//  PersonCatalogView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct PersonCatalogView: View {
    let films: [MovieCD] = CoreDataManager.shared.getFilms()
    var body: some View {
        VStack {
            CustomHeaderView(textLabel: TabBarProperties.personCatalog.tabBarTitle)
                .padding(.horizontal, 16)
            
            //TODO: - сдела заглушки, как будут отделены фильмы от сериалов, нужно будет запихнуть данные сюда
            Text("Количество:\(CoreDataManager.shared.getFilms().count)")
            ScrollView {
                ForEach(films, id: \.self) { movie in
                    LazyVStack(alignment: .leading){
                        VStack(alignment: .leading) {
                            ZStack{
                                
                                Text(movie.name ?? " ")
                                    .font(.system(size: 16))
                                    .lineLimit(1)
                            }
                            
                        }
                        .foregroundColor(Color.white)
                        .padding()
                        .cornerRadius(10)
                        .frame(height: 250)
                    }
                }
            }
            .background(Color.Neutral.num3)
        }
    }
}
