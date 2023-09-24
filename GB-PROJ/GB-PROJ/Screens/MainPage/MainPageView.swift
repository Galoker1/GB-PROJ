//
//  MainPageView.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import Foundation
import SwiftUI

struct MainPageView: View {
    @StateObject private var viewModel = MaingPageViewModel()
    var body: some View {
        VStack{
            Text("Hello")
            Text(String(viewModel.films.count))
            List{
                ForEach(viewModel.films, id: \.self){ movie in
                    HStack{
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
        .background(Color.pink)
        .onAppear {
            viewModel.loadData()
        }

    }
}
