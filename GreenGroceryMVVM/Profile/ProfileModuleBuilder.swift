
import Foundation
import UIKit

class ProfileModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = ProfileViewController()
        return factory(view)
    }
}
