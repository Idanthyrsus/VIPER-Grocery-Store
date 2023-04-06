//
//  CartInteractor.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 05.04.2023.
//

import Foundation
import UIKit

protocol CartUseCase {
    func getCartCount(closure: @escaping CartCountClosure)
}

class CartInteractor {
    
    var database: CartDB
    
    init(database: CartDB) {
        self.database = database
    }
}

extension CartInteractor: CartUseCase {
    func getCartCount(closure: @escaping CartCountClosure) {
        self.database.getCount(closure: closure)
    }
    
}
