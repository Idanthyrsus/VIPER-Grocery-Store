//
//  TabBarModuleBuilder.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 31.03.2023.
//

import Foundation
import UIKit

class TabBarModuleBuilder {
    static func build(submodules: TabBarRouter.Submodules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let interactor = CartInteractor(database: RealmDatabase.shared)
        let presenter = TabBarPresenter(interactor: interactor)
        let tabBarController = GroceryTabBarController(tabs: tabs, presenter: presenter)
        presenter.view = tabBarController
        return tabBarController
    }
}
