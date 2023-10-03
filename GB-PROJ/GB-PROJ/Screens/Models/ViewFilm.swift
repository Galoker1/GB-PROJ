//
//  ViewFilm.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 25.09.2023.
//

import Foundation
import SwiftUI
import Combine

struct ViewFilmViewModel {
    let name: String
    let poster: UIImage?
}

class ViewFilm: Identifiable, Hashable, ObservableObject {
    
    let id = UUID()
    let kpRating: Double
    let imdbEating: Double
    let criticsRating: Double
    let name: String
    let description: String
    let year: Int
    let genres: String
    let countries: String
    let movieLength: Int
    @Published var poster: UIImage?
    
    init(kpRating: Double,
         imdbEating: Double,
         criticsRating: Double,
         name: String,
         description: String,
         year: Int,
         photoUrl: String,
         countries: [Country],
         genres: [Genre],
         movieLength: Int?)
    {
        self.kpRating = kpRating
        self.imdbEating = imdbEating
        self.criticsRating = criticsRating
        self.name = name
        self.description = description
        self.year = year
        self.genres = genres.map { $0.name }.joined(separator: ", ")
        self.countries = countries.map { $0.name }.joined(separator: ", ")
        self.movieLength = movieLength ?? 0
        loadPhoto(url: photoUrl)
    }
    func loadPhoto(url: String) {
            NetworkManager.shared.loadImageFromURL(url) { image in
                if let image = image {
                    self.poster = image
                }
                else {
                    self.poster = UIImage(named: "square.and.arrow.up")
                }
            }
    
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Также можно переопределить оператор == для сравнения объектов
    static func == (lhs: ViewFilm, rhs: ViewFilm) -> Bool {
        return lhs.id == rhs.id
    }
}
