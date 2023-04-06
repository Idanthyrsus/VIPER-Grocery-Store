//
//  TabBarPresenter.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 05.04.2023.
//

import Foundation

protocol TabBarPresentation {
    func viewDidLoad()
}

class TabBarPresenter {
    
    weak var view: TabBarView?
    var interactor: CartUseCase?
    
    init(interactor: CartInteractor) {
        self.interactor = interactor
    }
}

extension TabBarPresenter: TabBarPresentation {
    func viewDidLoad() {
        interactor?.getCartCount {
            self.view?.updateCartCount(count: $0)
        }
    }
}
