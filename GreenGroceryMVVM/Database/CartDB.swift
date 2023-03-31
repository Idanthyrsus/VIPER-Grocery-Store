//
//  CartDB.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 29.03.2023.
//

import Foundation

protocol CartDB {
    func updateCart(using cartItem: CartItem) -> Bool 
}
