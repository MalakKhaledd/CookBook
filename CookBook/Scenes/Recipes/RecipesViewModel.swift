//
//  RecipesViewModel.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import Foundation
import UIKit

class RecipesViewModel {
    func loadRecipes(for category: String, completion: @escaping ([Recipe]?, Error?) -> Void) {
        NetworkProvider.shared.loadRecipes(for: category) { data, response, error in
            if error == nil {
                guard let data = data, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                        completion(recipes.recipes, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
