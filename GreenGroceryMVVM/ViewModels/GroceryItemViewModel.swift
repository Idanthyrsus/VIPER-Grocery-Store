//
//  GroceryItemViewModel.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 28.03.2023.
//

import Foundation

struct GroceryItemViewModel {
    let id: String
    let title: String
    let details: String
    let image: String
    let price: String
    
    init(using groceryModel: Grocery) {
        self.id = groceryModel.skuId
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = "$\(groceryModel.price)"
    }
}
