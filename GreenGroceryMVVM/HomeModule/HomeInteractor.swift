//
//  HomeInteractor.swift
//  GreenGrocery
//
//  Created by Alexander Korchak on 25.03.2023.
//

import Foundation

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClosure)
}

class HomeInteractor {
    var service: GroceriesAPI
    
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    func getGroceries(completion: (GroceryResult) -> ()) {
        service.fetchGroceries { result in
            completion(result)
        }
    }
}
