//
//  MainPageView.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import SwiftUI

struct MainPageView: View {
    @StateObject private var viewModel = MainPageViewModel()
    @State private var isSecondViewActive = false
    @State private var isStyled = true
    @State var selectedMovie: ViewFilm? = nil
    let columns = [
        GridItem(.flexible(), spacing: 16), // Две карточки в строке с промежутком 16 точек
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
            VStack {
                CustomDisplayTextLabel(textLabel: TabBarProperties.moviesCatalog.tabBarTitle,
                                       color: Color.Primary.num1,
                                       style: .T1DisplaySemibold)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.films, id: \.self) { movie in
                            VStack(alignment: .leading){
                                Button() {
                                    selectedMovie = movie
                                    isSecondViewActive = true
                                } label: {
                                    VStack(alignment: .leading) {
                                        ZStack{
                                            Image(uiImage: movie.poster ?? UIImage())
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(10)
                                        }
                                        .padding([.leading, .trailing], 5)
                                        
                                        Text(movie.name)
                                            .font(.system(size: 16))
                                            .lineLimit(1)
                                    }
                                }
                                .sheet(isPresented: $isSecondViewActive) {
                                    DescriptionMovieView(viewFilm: selectedMovie ?? viewModel.films[0])
                                }
                            }
                            .foregroundColor(Color.white)
                            .padding()
                            .cornerRadius(10)
                            .frame(height: 250)
                        }
                    }
                    .padding(16)
                }
            }
            .background(Color.Neutral.num3)
            .onAppear {
                viewModel.loadData()
            }
    }
    struct NoButtonStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
        }
    }
}

struct DescriptionMovieView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
