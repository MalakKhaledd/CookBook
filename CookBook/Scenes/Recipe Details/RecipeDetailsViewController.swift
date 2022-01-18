//
//  RecipeDetailsViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 18/01/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    var recipeID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeDetailsViewModel().loadRecipeDetails(for: recipeID)
    }
}
