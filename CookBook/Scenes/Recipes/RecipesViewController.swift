//
//  RecipesViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import UIKit

class RecipesViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    var category: String = ""
    
    // MARK: - Private Properties
    
    private var viewModel: RecipesViewModel?
    private var recipes: [Recipe]?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCategoryTitle()
        configureTableView()
        configureViewModel()
        loadRecipes()
    }
    
    // MARK: - Private Functions
    
    private func configureViewModel() {
        viewModel = RecipesViewModel()
    }
    
    private func setCategoryTitle() {
        self.title = category
    }

    private func loadRecipes() {
        viewModel?.loadRecipes(for: category) { [weak self] recipes, error in
            self?.recipes = recipes
            self?.reloadTableView()
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ImageTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTitleTableViewCell")
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTitleTableViewCell") as? ImageTitleTableViewCell
        let recipe = recipes?[indexPath.row]
        cell?.selectionStyle = .none
        cell?.configure(
            imageURL: URL(string: recipe?.thumbnail ?? ""),
            title: recipe?.title ?? ""
        )
        return cell ?? UITableViewCell()
    }
}

extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = recipes?[indexPath.row]
        let storyboard = UIStoryboard(name: "RecipeDetails", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController {
            viewController.recipeID = selectedRecipe?.id ?? ""
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
