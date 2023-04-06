//
//  HomeInteractor.swift
//  GreenGrocery
//
//  Created by Alexander Korchak on 25.03.2023.
//

import Foundation

typealias SkuItem = (skuId: String, quantity: Int)

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClosure)
    func addToCart(skuItem: SkuItem) -> Bool
}

class HomeInteractor {
    var service: GroceriesAPI
    var database: CartDB
    
    init(service: GroceriesAPI, database: CartDB) {
        self.service = service
        self.database = database
    }
}

extension HomeInteractor: HomeUseCase {
    
    func addToCart(skuItem: SkuItem) -> Bool {
        guard skuItem.quantity > 0 else {
            return self.database.delete(usingSkuId: skuItem.skuId)
        }
       return self.database.updateCart(using: CartItem(skuId: skuItem.skuId, value: skuItem.quantity))
    }
    
    func getGroceries(completion: (GroceryResult) -> Void) {
        service.fetchGroceries { result in
            completion(result)
        }
    }
}
