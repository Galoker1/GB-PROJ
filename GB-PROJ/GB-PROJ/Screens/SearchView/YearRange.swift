//
//  YearRange.swift
//  GB-PROJ
//
//  Created by Александра Макей on 17.10.2023.
//

import Foundation

struct YearRange {
    static let minimumYear = 1999
    static let maximumYear = Calendar.current.component(.year, from: Date())
    
    static func allYears() -> [Int] {
        var years = [Int]()
        for year in minimumYear...maximumYear {
            years.append(year)
        }
        return years
    }
}
