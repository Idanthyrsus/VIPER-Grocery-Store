//
//  CartItem.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 29.03.2023.
//

import Foundation

struct CartItem {
    let skuId: String
    let value: Int
    
    init(skuId: String, value: Int) {
        self.skuId = skuId
        self.value = value
    }
}
