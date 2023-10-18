//
//  TVShowViewModel.swift
//  GB-PROJ
//
//  Created by Александра Макей on 18.10.2023.
//

import Foundation
import Combine
import SwiftUI
import Dispatch

class TVShowViewModel: ObservableObject {
    //Заглушки для проверки UI компонентов
    @Published var tvShow: [TVShowModel] = [TVShowModel.placeholder(), TVShowModel.placeholder(), TVShowModel.placeholder()]
    
    
    var networkFilms: [Film] = []
//    @Published var tvShow: [TVShowModel] = []
    @Published var images: UIImage = UIImage()
    private var cancellables = Set<AnyCancellable>()
    var networkManager = NetworkManager.shared

    init() { }

    func loadData() {}
    
    public func searchByName(searchString: String) {}

}
