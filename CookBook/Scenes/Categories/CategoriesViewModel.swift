//
//  CategoriesViewModel.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import Foundation

class CategoriesViewModel {
    func loadCategories(completion: @escaping ([Category]?, Error?) -> Void) {
        NetworkProvider.shared.loadCategories { data, response, error in
            if error == nil {
                guard let data = data, let response = response as? HTTPURLResponse else { return }
                do {
                    if response.statusCode == 200 {
                        let categories = try JSONDecoder().decode(Categories.self, from: data)
                        completion(categories.categories, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
