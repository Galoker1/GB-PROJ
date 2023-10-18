//
//  MediaItem.swift
//  GB-PROJ
//
//  Created by Александра Макей on 18.10.2023.
//

import Foundation

enum MediaItem: Codable {
    case movie(Movie)
    case tvShow(TVShow)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let serial = try container.decode(Bool.self, forKey: .serial)
        if serial {
            self = .tvShow(try TVShow(from: decoder))
        } else {
            self = .movie(try Movie(from: decoder))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .movie(let movie):
            try container.encode(false, forKey: .serial)
            try movie.encode(to: encoder)
        case .tvShow(let tvShow):
            try container.encode(true, forKey: .serial)
            try tvShow.encode(to: encoder)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case serial
    }
}
