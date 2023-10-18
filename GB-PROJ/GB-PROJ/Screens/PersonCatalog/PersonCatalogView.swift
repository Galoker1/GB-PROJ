//
//  PersonCatalogView.swift
//  GB-PROJ
//
//  Created by Alex Mak on 25/09/2023.
//

import SwiftUI

struct PersonCatalogView: View {
    @StateObject private var filmViewModel = FilmViewModel()
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
                Section(header:
                            CustomDisplayTextLabel(textLabel: "Фильмы",
                                                   color: Color.Primary.num1,
                                                   style: .T1DisplaySemibold)) {
                    ForEach(filmViewModel.films, id: \.self) { movie in
                        CustomTableViewCell(mediaItem: movie)

                    }
                    .onDelete { indexSet in
                        deleteItems($filmViewModel.films, at: indexSet)
                    }
                } .listRowBackground(Color.Neutral.num2)
                
                Section(header:
                            CustomDisplayTextLabel(textLabel: "Сериалы",
                                                   color: Color.Primary.num1,
                                                   style: .T1DisplaySemibold)) {
                    ForEach(tvShowViewModel.tvShow, id: \.self) { series in
                        CustomTableViewCell(mediaItem: series)
                        
                    }  .onDelete { indexSet in
                        deleteItems($tvShowViewModel.tvShow, at: indexSet)
                    }
                    
                }.listRowBackground(Color.Neutral.num2)
            }
            .listStyle(InsetListStyle())
            .background(Color.Neutral.num3)
            .scrollContentBackground(.hidden)
        }
        .background(Color.Neutral.num3)
        
    }
    
    func deleteItems<T>(_ items: Binding<[T]>, at offsets: IndexSet) where T: Identifiable {
        items.wrappedValue.remove(atOffsets: offsets)
    }
}

//
//    var body: some View {
//        VStack {
//            CustomHeaderView(textLabel: TabBarProperties.personCatalog.tabBarTitle)
//                .padding(.horizontal, 16)
//
//            //TODO: - сдела заглушки, как будут отделены фильмы от сериалов, нужно будет запихнуть данные сюда
//            Text("Количество:\(CoreDataManager.shared.getFilms().count)")
//            ScrollView {
//                ForEach(films, id: \.self) { movie in
//                    LazyVStack(alignment: .leading){
//                        VStack(alignment: .leading) {
//                            ZStack{
//
//                                Text(movie.name ?? " ")
//                                    .font(.system(size: 16))
//                                    .lineLimit(1)
//                            }
//
//                        }
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .cornerRadius(10)
//                        .frame(height: 250)


struct PersonCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCatalogView()
            .environmentObject(FilmViewModel())
            .environmentObject(TVShowViewModel())
        }
    }
}
