//
//  RecipeDetailsViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 18/01/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    // MARK: - Public Properties
    
    var recipeID: String = ""
    
    // MARK: - Private Properties
    
    private var viewModel: RecipeDetailsViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        loadRecipeDetails()
    }
    
    // MARK: - Private Properties
    
    private func configureViewModel() {
        viewModel = RecipeDetailsViewModel()
    }
    
    private func loadRecipeDetails() {
        viewModel?.loadRecipeDetails(for: recipeID) { recipeDetails, ingredients, error in
            print(recipeDetails)
        }
    }
}
