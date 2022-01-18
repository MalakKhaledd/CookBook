//
//  RecipeDetailsViewModel.swift
//  CookBook
//
//  Created by Malak Badawy on 18/01/2022.
//

import Foundation

class RecipeDetailsViewModel {
    func loadRecipeDetails(for id: String) {
        NetworkProvider.shared.loadRecipeDetails(with: id) { data, response, error in
            if error == nil {
                guard let data = data, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let recipes = try JSONDecoder().decode(Meals.self, from: data)
                        print(recipes)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
