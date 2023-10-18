//
//  MovieModel.swift
//  GB-PROJ
//
//  Created by Atudinov Dias on 24.09.2023.
//

import SwiftUI

struct Movie: Codable, Hashable {
    let docs: [Film]?
    enum CodingKeys: String, CodingKey {
        case docs
    }
}


struct Film: Codable, Hashable{
    let id: Int?
    let rating: Rating?
    let name: String?
    let description: String?
    let year: Int?
    let movieLength: Int?
    let poster: Poster?
    let genres: [Genre]
    let countries: [Country]
}

struct Genre: Codable, Hashable {
    let name: String?
}

struct Country: Codable, Hashable {
    let name: String?
}

struct Rating: Codable, Hashable{
    let kp: Double?
    let imdb: Double?
    let filmCritics: Double?
}

struct Poster: Codable, Hashable{
    let url: String?
    let previewUrl: String?
}

