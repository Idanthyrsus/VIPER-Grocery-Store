//
//  HomeModuleBuilder.swift
//  GreenGrocery
//
//  Created by Alexander Korchak on 25.03.2023.
//

import Foundation
import UIKit

class HomeModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = HomeViewController()
        view.title = "Fresh Groceries"
        let interactor = HomeInteractor(service: StubService.shared, database: RealmDatabase.shared)
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(interactor: interactor, router: router, view: view)
        view.presenter = presenter
        return factory(view)
    }
}
