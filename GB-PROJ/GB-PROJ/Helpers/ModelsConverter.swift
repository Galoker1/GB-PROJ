//
//  ModelsConverter.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 25.09.2023.
//

import Foundation

class ModelsConverter {
    static let shared = ModelsConverter()
    private init() {}
    
    func convertFilm(networkModel: [Film]) -> [ViewFilm] {
        var result: [ViewFilm] = []
        for film in networkModel {
            result.append(ViewFilm(kpRating: film.rating.kp,
                                   imdbEating: film.rating.imdb,
                                   criticsRating: film.rating.filmCritics,
                                   name: film.name,
                                   description: film.description,
                                   year: film.year,
                                   photoUrl: film.poster.url))
        }
        return result
    }
    
}
