//
//  FilmViewModel.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import Foundation
import Combine
import SwiftUI
import Dispatch

class FilmViewModel: ObservableObject {
    //Заглушки для проверки UI компонентов
    
    @Published var films: [ViewFilm] = [ViewFilm.placeholder(), ViewFilm.placeholder(), ViewFilm.placeholder()]
    var networkFilms: [Film] = []
//    @Published var films: [ViewFilm] = []
    @Published var images: UIImage = UIImage()
    private var cancellables = Set<AnyCancellable>()
    var networkManager = NetworkManager.shared

    init() { }

    func loadData() {
        networkManager.fetchMovie(limit: 5){ result in
            switch result {
            case .success(let data):
                let serialQueue = DispatchQueue(label: "com.myapp.myserialqueue")
                self.networkFilms = data.docs ?? []
                serialQueue.async {
                               DispatchQueue.main.async {
                                   self.films = []
                               }
                           }
                for networkModel in self.networkFilms {
                    serialQueue.async { // Use your serial queue
                        if let url = networkModel.poster?.url {
                            NetworkManager.shared.loadImageFromURL(url) { image in
                                if let image = image {
                                    let poster = image
                                    let film = ViewFilm(id: networkModel.id,
                                                        kpRating: networkModel.rating?.kp,
                                                        imdbEating: networkModel.rating?.imdb,
                                                        criticsRating: networkModel.rating?.filmCritics,
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
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func searchByName(searchString: String) {
        networkManager.fetchSearch(name: searchString) { result in
            switch result {
            case .success(let data):
                let serialQueue = DispatchQueue(label: "com.myapp.myserialqueue")
                self.networkFilms = data.docs ?? []
                serialQueue.async {
                    self.films = []
                }
                for networkModel in self.networkFilms {
                    serialQueue.async { // Use your serial queue
                        if let url = networkModel.poster?.url {
                            NetworkManager.shared.loadImageFromURL(url) { image in
                                if let image = image {
                                    let poster = image
                                    let film = ViewFilm(id: networkModel.id,
                                                        kpRating: networkModel.rating?.kp,
                                                        imdbEating: networkModel.rating?.imdb,
                                                        criticsRating: networkModel.rating?.filmCritics,
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
                }
            case .failure(let error):
                print("Ошибка конвертации \(error)")
            }
        }
    }

}
