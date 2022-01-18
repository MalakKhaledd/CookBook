//
//  Category.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let id: String
    let title: String
    let thumbnail: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
