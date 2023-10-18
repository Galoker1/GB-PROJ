//
//  PersonCatalogView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct PersonCatalogView: View {
    @StateObject private var filmViewModel = FilmViewModel(typeOfTitle: "movie")
    @StateObject private var tvShowViewModel = TVShowViewModel()
    let films: [MovieCD] = CoreDataManager.shared.getFilms()
    var body: some View {
        VStack {
            CustomDisplayTextLabel(textLabel: TabBarProperties.personCatalog.tabBarTitle,
                                   color: Color.Primary.num1,
                                   style: .T1DisplaySemibold)
            .padding(.horizontal, 16)
            Divider().background(Color.Primary.num1)
            List {
                ForEach(films, id: \.self) { movie in
                    LazyVStack(alignment: .leading){
                        VStack(alignment: .leading) {
                            HStack{
                                Image(uiImage: UIImage(data: movie.poster ?? Data()) ?? UIImage())
                                    .resizable()
                                    .padding(.vertical, 2)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                                Text(movie.name ?? " ")
                                    .font(.system(size: 16))
                                    .lineLimit(1)
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    .listRowBackground(Color.Neutral.num2)
                    .swipeActions {
                        Button("Удалить", role: .destructive) {
                            CoreDataManager.shared.deleteById(id: movie.titleId)
                        }
                    }
                }
            }
            .background(Color.Neutral.num3)
            .scrollContentBackground(.hidden)
        }
        .background(Color.Neutral.num3)
        
    }
    
    
//    struct PersonCatalogView_Previews: PreviewProvider {
//        static var previews: some View {
//            PersonCatalogView()
//                .environmentObject(FilmViewModel())
//                .environmentObject(TVShowViewModel())
//        }
//    }
}
