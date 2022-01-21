//
//  RecipeDetailsViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 18/01/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var tagesLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ingredientLabel1: UILabel!
    @IBOutlet weak var ingredientLabel2: UILabel!
    @IBOutlet weak var ingredientLabel3: UILabel!
    @IBOutlet weak var ingredientLabel4: UILabel!
    @IBOutlet weak var ingredientLabel5: UILabel!
    @IBOutlet weak var ingredientLabel6: UILabel!
    @IBOutlet weak var ingredientLabel7: UILabel!
    @IBOutlet weak var ingredientLabel8: UILabel!
    @IBOutlet weak var ingredientLabel9: UILabel!
    @IBOutlet weak var ingredientLabel10: UILabel!
    @IBOutlet weak var ingredientLabel11: UILabel!
    @IBOutlet weak var ingredientLabel12: UILabel!
    @IBOutlet weak var ingredientLabel13: UILabel!
    @IBOutlet weak var ingredientLabel14: UILabel!
    @IBOutlet weak var ingredientLabel15: UILabel!
    @IBOutlet weak var ingredientLabel16: UILabel!
    @IBOutlet weak var ingredientLabel17: UILabel!
    @IBOutlet weak var ingredientLabel18: UILabel!
    @IBOutlet weak var ingredientLabel19: UILabel!
    @IBOutlet weak var ingredientLabel20: UILabel!
    
    // MARK: - Public Properties

    var recipe: Recipe?
    
    // MARK: - Private Properties
    
    private var viewModel: RecipeDetailsViewModel?
    private var recipeDetails: RecipeDetails?
    private var ingredients: [String]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureViewModel()
        loadRecipeDetails()
    }
    
    // MARK: - Private Properties
    
    private func configureTitle() {
        self.title = recipe?.title
    }
    
    private func configureViewModel() {
        viewModel = RecipeDetailsViewModel()
    }
    
    private func loadRecipeDetails() {
        viewModel?.loadRecipeDetails(for: recipe?.id ?? "") { recipeDetails, ingredients, error in
            self.recipeDetails = recipeDetails
            self.ingredients = ingredients
            self.configureView()
        }
    }
    
    private func configureView() {
        DispatchQueue.main.async { [weak self] in
            if let imageURL = URL(string: self?.recipeDetails?.thumbnail ?? "") {
                self?.recipeImageView.load(url: imageURL) { }
            }
            self?.cuisineLabel.text = "Cuisine: \(self?.recipeDetails?.cuisine ?? "-")"
            self?.tagesLabel.text = "Tags: \(self?.recipeDetails?.tags ?? "-")"
            self?.instructionsLabel.text = self?.recipeDetails?.instructions
            self?.configureIngredients()
        }
    }
    
    private func configureIngredients() {
        ingredientLabel1.text = ingredients?[0] ?? ""
        ingredientLabel2.text = ingredients?[1] ?? ""
        ingredientLabel3.text = ingredients?[2] ?? ""
        ingredientLabel4.text = ingredients?[3] ?? ""
        ingredientLabel5.text = ingredients?[4] ?? ""
        ingredientLabel6.text = ingredients?[5] ?? ""
        ingredientLabel7.text = ingredients?[6] ?? ""
        ingredientLabel8.text = ingredients?[7] ?? ""
        ingredientLabel9.text = ingredients?[8] ?? ""
        ingredientLabel10.text = ingredients?[9] ?? ""
        ingredientLabel11.text = ingredients?[10] ?? ""
        ingredientLabel12.text = ingredients?[11] ?? ""
        ingredientLabel13.text = ingredients?[12] ?? ""
        ingredientLabel14.text = ingredients?[13] ?? ""
        ingredientLabel15.text = ingredients?[14] ?? ""
        ingredientLabel16.text = ingredients?[15] ?? ""
        ingredientLabel17.text = ingredients?[16] ?? ""
        ingredientLabel18.text = ingredients?[17] ?? ""
        ingredientLabel19.text = ingredients?[18] ?? ""
        ingredientLabel20.text = ingredients?[19] ?? ""
    }
}
