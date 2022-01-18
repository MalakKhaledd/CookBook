//
//  Recipes.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import Foundation

struct Recipes: Codable {
    let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
}

struct Recipe: Codable {
    let title: String
    let thumbnail: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}
