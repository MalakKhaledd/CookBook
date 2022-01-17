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
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
