//
//  MainPageViewModel.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import Foundation
import Combine
import SwiftUI
import Dispatch

class MainPageViewModel: ObservableObject {
    var networkFilms: [Film] = []
    @Published var films: [ViewFilm] = []
    @Published var images: UIImage = UIImage()
    private var cancellables = Set<AnyCancellable>()
    var networkManager = NetworkManager.shared

    init() { }

    func loadData() {
        networkManager.fetchMovie(limit: 10) { result in
            switch result {
            case .success(let data):
                let serialQueue = DispatchQueue(label: "com.myapp.myserialqueue")
                self.networkFilms = data.docs ?? []
                for networkModel in self.networkFilms {
                    serialQueue.async { // Use your serial queue
                        NetworkManager.shared.loadImageFromURL(networkModel.poster.url) { image in
                            if let image = image {
                                let poster = image
                                let film = ViewFilm(kpRating: networkModel.rating.kp,
                                                     imdbEating: networkModel.rating.imdb,
                                                     criticsRating: networkModel.rating.filmCritics,
                                                     name: networkModel.name,
                                                     description: networkModel.description,
                                                     year: networkModel.year,
                                                     poster: poster,
                                                     countries: networkModel.countries,
                                                     genres: networkModel.genres,
                                                     movieLength: networkModel.movieLength)

                                // Use receive(on:) to ensure updates happen on the main thread
                                DispatchQueue.main.async {
                                    self.films.append(film)
                                }
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
