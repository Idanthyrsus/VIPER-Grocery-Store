//
//  StubService.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 27.03.2023.
//

import Foundation

//MARK: - Typealias

typealias GroceriesClosure = (GroceryResult) -> ()

protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure)
}

class StubService {
    static let shared: StubService = StubService()

    private init() {}
}

extension StubService: GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) {
        if let url = Bundle.main.url(forResource: "Products", withExtension: "json") {
            do {
               let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            } catch let error {
                print(error)
            }
        }
    }
}

