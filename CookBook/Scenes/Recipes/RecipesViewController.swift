//
//  RecipesViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import UIKit

class RecipesViewController: UIViewController {
    var viewModel: RecipesViewModel?
    var category: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        loadRecipes()
    }
    
    private func configureViewModel() {
        viewModel = RecipesViewModel()
    }
    
    private func loadRecipes() {
        viewModel?.loadRecipes(for: category) { recipes, error in
            print(recipes)
        }
    }
}
