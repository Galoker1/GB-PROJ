//
//  MainPageView.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import SwiftUI

struct MainPageView: View {
    @StateObject private var viewModel = MainPageViewModel()
    
    var body: some View {
        VStack {
            CustomDisplayTextLabel(textLabel: TabBarProperties.moviesCatalog.tabBarTitle,
                                   color: Color.Primary.num1,
                                   style: .T1DisplaySemibold)
            
//            Text(String(viewModel.films.count))
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
        
        .onAppear {
            viewModel.loadData()
        }
        
    }
}
