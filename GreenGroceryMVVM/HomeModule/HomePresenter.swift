//
//  HomePresenter.swift
//  GreenGrocery
//
//  Created by Alexander Korchak on 25.03.2023.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
    func onAddToCart(skuItem: SkuItem)
}

class HomePresenter {
    var interactor: HomeUseCase?
    var router: HomeRouting?
    weak var view: HomeView?
    
    init(interactor: HomeUseCase, router: HomeRouting, view: HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).sync { [weak self] in
            self?.interactor?.getGroceries(completion: { result in
               let groceryList = result.groceries.compactMap { GroceryItemViewModel(using: $0) }
                DispatchQueue.main.async {
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
            })
        }
    }
    
    func onAddToCart(skuItem: SkuItem) {
        DispatchQueue.global(qos: .background).async {
           let updated = self.interactor?.addToCart(skuItem: skuItem)
            print("Add to cart updated with result \(String(describing: updated))")
            DispatchQueue.main.async {
                // TODO: - Implement activity indicator
            }
        }
    }
}

