//
//  URLSession.swift
//  GB-PROJ
//
//  Created by Atudinov Dias on 24.09.2023.
//

import Foundation
import SwiftUI

class NetworkManager {
    var resultMovies: Movie? = nil
    static let shared = NetworkManager()
    typealias CompletionHandler = (Result<Movie, Error>) -> Void
    
    private init() {
        
    }
    func fetchMovie(name: String, limit: Int, completion: @escaping CompletionHandler){
        
        let apiKey = "5FHVVKT-0DAMRVZ-KPQCZYP-HZBFTY8"
        let urlStr = "https://api.kinopoisk.dev/v1.3/movie"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        let queryItems = [
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "limit", value: "\(limit)"),
        ]
        var urlComponents = URLComponents(string: urlStr)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        request.setValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    let movies = try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        //        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        //            if let error = error {
        //                print("Ошибка: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            // Обработка данных и ответа здесь
        //            if let data = data {
        //                let movies = try JSONDecoder().decode(Movie.self, from: data)
        //                       resultMovies = movies
        //            }
        //        }
        //
        
        
        
        //        { [weak self] data, _, error in
        //            if let error = error {
        //                print("Error: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            guard let data = data else {
        //                print("No data received")
        //                return
        //            }
        //
        //            //Convert to JSON
        //            do{
        //                let movies = try JSONDecoder().decode(Movie.self, from: data)
        //                DispatchQueue.main.async {
        //                    resultMovies = movies
        //                }
        //            } catch {
        //                print(error)
        //            }
        //
        //        }
        task.resume()
    }
    
    
    func fetchSearch(name: String, completion: @escaping CompletionHandler){
        
        let apiKey = "5FHVVKT-0DAMRVZ-KPQCZYP-HZBFTY8"
        let urlStr = "https://api.kinopoisk.dev/v1.3/movie"
        
        guard let url = URL(string: urlStr) else {
            print("Invalid URL: \(urlStr)")
            return
        }
        let queryItems = [
            URLQueryItem(name: "name", value: name),
        ]
        var urlComponents = URLComponents(string: urlStr)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        request.setValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
        
        let session = URLSession.shared
        print("+++++++URL: \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Обработка данных и ответа здесь
            if let data = data {
                do{
                    let movies = try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        //        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        //            if let error = error {
        //                print("Ошибка: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            // Обработка данных и ответа здесь
        //            if let data = data {
        //                let movies = try JSONDecoder().decode(Movie.self, from: data)
        //                       resultMovies = movies
        //            }
        //        }
        //
        
        
        
        //        { [weak self] data, _, error in
        //            if let error = error {
        //                print("Error: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            guard let data = data else {
        //                print("No data received")
        //                return
        //            }
        //
        //            //Convert to JSON
        //            do{
        //                let movies = try JSONDecoder().decode(Movie.self, from: data)
        //                DispatchQueue.main.async {
        //                    resultMovies = movies
        //                }
        //            } catch {
        //                print(error)
        //            }
        //
        //        }
        task.resume()
    }

    func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Ошибка при загрузке изображения: \(error)")
                    completion(nil)
                    return
                }
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            task.resume()
        } else {
            completion(nil)
        }
    }
}
