//
//  TVShow.swift
//  GB-PROJ
//
//  Created by Александра Макей on 18.10.2023.
//

import UIKit


class TVShowModel: MediaItem, Identifiable, Hashable, ObservableObject {

    let id = UUID()
    let name: String
    let poster: UIImage?
//    let number: Int
//    let episodes: [Episode]
    
    init(name: String, poster: UIImage?/*, number: Int, episodes: [Episode]*/) {
        self.name = name
        self.poster = poster
//        self.number = number
//        self.episodes = episodes
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: TVShowModel, rhs: TVShowModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Episode: Codable, Identifiable {
    let seasonNumber: Int
    let episodeNumber: Int
    let nameRu: String
    let nameEn: String
    let synopsis: String
    let releaseDate: String
    
    var id: String {
        return "\(seasonNumber)-\(episodeNumber)"
    }
}

extension TVShowModel {
    static func placeholder() -> TVShowModel {
        return TVShowModel(name: "Заглушка для сериала", poster: UIImage(named: "movieTest"))
    }
}


