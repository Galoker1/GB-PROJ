//
//  MainPageViewModel.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 24.09.2023.
//

import Foundation
import Combine

class MaingPageViewModel: ObservableObject {
    @Published var films: [Film]
    
    init(films: [Film]) {
        self.films = films
    }
    
}
