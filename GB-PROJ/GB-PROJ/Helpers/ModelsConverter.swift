//
//  ModelsConverter.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 25.09.2023.
//

import Foundation
import SwiftUI
class ModelsConverter {
    static let shared = ModelsConverter()
    private init() {}
    
    func convertFilm(networkModel: Film) -> ViewFilm? {
        var result: ViewFilm? = nil
                NetworkManager.shared.loadImageFromURL(networkModel.poster.url) { image in
                    if let image = image {
                        let poster = image
                        result = ViewFilm(kpRating: networkModel.rating.kp,
                                               imdbEating: networkModel.rating.imdb,
                                               criticsRating: networkModel.rating.filmCritics,
                                               name: networkModel.name,
                                               description: networkModel.description,
                                               year: networkModel.year,
                                               poster: poster,
                                               countries: networkModel.countries,
                                               genres: networkModel.genres,
                                               movieLength: networkModel.movieLength)
                    }

                }

        return result
        }
    }

