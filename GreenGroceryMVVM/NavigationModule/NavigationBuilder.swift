//
//  NavigationBuilder.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 29.03.2023.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
   static func build(rootView: UIViewController) -> UINavigationController {
       
       let textStyleAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor : UIColor.white,
        .font : UIFont.init(name: "AvenirNext-Demibold", size: 22.0)!
       ]
       
       let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor : UIColor.white,
        .font : UIFont.init(name: "AvenirNext-Demibold", size: 28.0)!
       ]
       
       let navigationController = UINavigationController(rootViewController: rootView)
       navigationController.navigationBar.barTintColor = UIColor.red
       navigationController.navigationBar.tintColor = UIColor.white
       navigationController.navigationBar.titleTextAttributes = textStyleAttributes
       navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
       navigationController.navigationBar.isTranslucent = false
       navigationController.navigationBar.prefersLargeTitles = true
       
       if #available(iOS 15.0, *) {
           let navigationBarAppearance = UINavigationBarAppearance()
           navigationBarAppearance.configureWithOpaqueBackground()
           UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
       }
       return navigationController
    }
}
