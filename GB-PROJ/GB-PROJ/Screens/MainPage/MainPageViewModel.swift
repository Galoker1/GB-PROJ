//
//  MainPageViewModel.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import Foundation
import Combine
import SwiftUI

class MainPageViewModel: ObservableObject {
    var networkFilms: [Film] = []
    @Published var films: [ViewFilm] = []
    @Published var images: UIImage = UIImage()
    private var cancellables = Set<AnyCancellable>()
    var networkManager = NetworkManager.shared
    
    init() { }
    
    func loadData() {
        networkManager.fetchMovie(limit: 30) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.networkFilms = data.docs ?? []
                    self.films =  ModelsConverter.shared.convertFilm(networkModel: self.networkFilms)
                }
            case .failure(let error):
                print(error)
            }
            
        }
        DispatchQueue.main.async {
            
        }
    }
    
}
