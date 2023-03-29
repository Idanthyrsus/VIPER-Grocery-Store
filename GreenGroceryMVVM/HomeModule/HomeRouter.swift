//
//  Router.swift
//  GreenGrocery
//
//  Created by Alexander Korchak on 25.03.2023.
//

import Foundation
import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouting {
    
}
