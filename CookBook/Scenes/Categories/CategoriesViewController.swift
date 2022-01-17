//
//  CategoriesViewController.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Private Properties
    
    private var viewModel: CategoriesViewModel?
    private var categories: [Category]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewModel()
        loadCategories()
    }
    
    // MARK: - Private Functions
    
    private func configureViewModel() {
        viewModel = CategoriesViewModel()
    }
    
    private func loadCategories() {
        viewModel?.loadCategories { [weak self] categories, error in
            self?.categories = categories
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

// MARK: - Table View Data Source

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTitleTableViewCell") as? ImageTitleTableViewCell
        let category = categories?[indexPath.row]
        cell?.selectionStyle = .none
        cell?.configure(
            imageURL: URL(string: category?.thumbnail ?? ""),
            title: category?.title ?? ""
        )
        return cell ?? UITableViewCell()
    }
}

// MARK: - Table View Delegate

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories?[indexPath.row]
        let storyboard = UIStoryboard(name: "Recipes", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController {
            viewController.category = category?.title ?? ""
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
