//
//  FavoriteMoviesView.swift
//  GB-PROJ
//
//  Created by Atudinov Dias on 24.09.2023.
//

import SwiftUI

//FIXME: - этот класс где -то используется?

struct FavoriteMoviesView: View {
    @StateObject private var viewModel = MovieViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.movies.docs ?? [], id: \.self){ movie in
                    
                        Text(movie.name)
                    }
                
            }
        }.onAppear {
            viewModel.fetchMovie(limit: 10)
            print(viewModel.movies.docs?.first?.description)
        }
    }
}

#Preview {
    FavoriteMoviesView()
}
