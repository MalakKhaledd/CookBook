//
//  NetworkProvider.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import Foundation

class NetworkProvider {
    // MARK: - Public Properties
    
    static let shared = NetworkProvider()
    
    // MARK: - Private Properties
    
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    private let session = URLSession(configuration: .default)
    
    // MARK: - Public Functions
    
    func loadCategories(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let categoriesURL = URL(string: buildURL(signature: "categories")) else { return }
        
        let task = session.dataTask(with: categoriesURL) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
    
    // MARK: - Private Functions
    
    private func buildURL(signature: String) -> String {
        return baseURL + signature + ".php"
    }
}
