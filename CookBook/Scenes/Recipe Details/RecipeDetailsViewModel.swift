//
//  RecipeDetailsViewModel.swift
//  CookBook
//
//  Created by Malak Badawy on 18/01/2022.
//

import Foundation

class RecipeDetailsViewModel {
    private var recipeDetails: RecipeDetails?
    var ingredients: [String]?

    func loadRecipeDetails(for id: String, completion: @escaping (RecipeDetails?, [String]?, Error?) -> Void) {
        NetworkProvider.shared.loadRecipeDetails(with: id) { data, response, error in
            if error == nil {
                guard let data = data, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let recipes = try JSONDecoder().decode(Meals.self, from: data)
                        self.recipeDetails = recipes.meals.first
                        self.ingredients = self.addAllIngredientsToArray(from: self.recipeDetails!)
                        completion(self.recipeDetails, self.ingredients, nil)
                    } catch {
                        completion(nil, nil, error)
                    }
                }
            }
        }
    }
    
    private func addAllIngredientsToArray(from recipe: RecipeDetails) -> [String] {
        var ingredients: [String] = []
        ingredients.append("\(recipe.measure1 ?? "") \(recipe.ingredient1 ?? "")")
        ingredients.append("\(recipe.measure2 ?? "") \(recipe.ingredient2 ?? "")")
        ingredients.append("\(recipe.measure3 ?? "") \(recipe.ingredient3 ?? "")")
        ingredients.append("\(recipe.measure4 ?? "") \(recipe.ingredient4 ?? "")")
        ingredients.append("\(recipe.measure5 ?? "") \(recipe.ingredient5 ?? "")")
        ingredients.append("\(recipe.measure6 ?? "") \(recipe.ingredient6 ?? "")")
        ingredients.append("\(recipe.measure7 ?? "") \(recipe.ingredient7 ?? "")")
        ingredients.append("\(recipe.measure8 ?? "") \(recipe.ingredient8 ?? "")")
        ingredients.append("\(recipe.measure9 ?? "") \(recipe.ingredient9 ?? "")")
        ingredients.append("\(recipe.measure10 ?? "") \(recipe.ingredient10 ?? "")")
        ingredients.append("\(recipe.measure11 ?? "") \(recipe.ingredient11 ?? "")")
        ingredients.append("\(recipe.measure12 ?? "") \(recipe.ingredient12 ?? "")")
        ingredients.append("\(recipe.measure13 ?? "") \(recipe.ingredient13 ?? "")")
        ingredients.append("\(recipe.measure14 ?? "") \(recipe.ingredient14 ?? "")")
        ingredients.append("\(recipe.measure15 ?? "") \(recipe.ingredient15 ?? "")")
        ingredients.append("\(recipe.measure16 ?? "") \(recipe.ingredient16 ?? "")")
        ingredients.append("\(recipe.measure17 ?? "") \(recipe.ingredient17 ?? "")")
        ingredients.append("\(recipe.measure18 ?? "") \(recipe.ingredient18 ?? "")")
        ingredients.append("\(recipe.measure19 ?? "") \(recipe.ingredient19 ?? "")")
        ingredients.append("\(recipe.measure20 ?? "") \(recipe.ingredient20 ?? "")")
        return removeAnyEmptyIngredient(from: ingredients)
    }
    
    private func removeAnyEmptyIngredient(from ingredients: [String]) -> [String] {
        return ingredients.filter { !($0.isEmpty || $0 == " ") }
    }
}
