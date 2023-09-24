//
//  URLSession.swift
//  GB-PROJ
//
//  Created by Atudinov Dias on 24.09.2023.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: Movie = Movie(docs: [Film(rating: Rating(kp: 0, imdb: 0, filmCritics: 0), name: "", description: "", year: 0, poster: Poster(url: "", previewUrl: " "))])
    
    func fetchMovie(limit: Int){
        
        let apiKey = "5FHVVKT-0DAMRVZ-KPQCZYP-HZBFTY8"
        let urlStr = "https://api.kinopoisk.dev/v1.3/movie"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        let queryItems = [
                URLQueryItem(name: "limit", value: "\(limit)"),
            ]
        var urlComponents = URLComponents(string: urlStr)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
                print("Invalid URL")
                return
            }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        request.setValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
   
        
        print("+++++++URL: \(request)")
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            //Convert to JSON
            do{
                let movies = try JSONDecoder().decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    self?.movies = movies
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
}
