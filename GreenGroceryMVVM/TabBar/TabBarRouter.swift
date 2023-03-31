//
//  TabBarRouter.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 31.03.2023.
//

import Foundation
import UIKit

class TabBarRouter {
    var viewController: UIViewController
    
    typealias Submodules = (
        home: UIViewController,
        cart: UIViewController,
        profile: UIViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TabBarRouter {
    static func tabs(usingSubmodules submodules: Submodules) -> GroceryTabs {
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 11)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 12)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 13)
        
        submodules.home.tabBarItem = homeTabBarItem
        submodules.cart.tabBarItem = cartTabBarItem
        submodules.profile.tabBarItem = profileTabBarItem
        
        return (
            home: submodules.home,
            cart: submodules.cart,
            profile: submodules.profile
        )
    }
}
