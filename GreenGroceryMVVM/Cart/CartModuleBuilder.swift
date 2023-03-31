//
//  Builder.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 31.03.2023.
//

import Foundation
import UIKit

class CartModuleBuiler {
    
   static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = CartViewController()
        return factory(view)
    }
}
