//
//  MediaItemProtocol.swift
//  GB-PROJ
//
//  Created by Александра Макей on 18.10.2023.
//

import SwiftUI

protocol MediaItem {
    var name: String { get }
    var poster: UIImage? { get }
}
