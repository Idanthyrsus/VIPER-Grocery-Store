//
//  CartDB.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 29.03.2023.
//

import Foundation

typealias CartCountClosure = (Int) -> Void

protocol CartDB {
    func updateCart(using cartItem: CartItem) -> Bool
    func getCount(closure: @escaping CartCountClosure)
    func delete(usingSkuId skuId: String) -> Bool
}
