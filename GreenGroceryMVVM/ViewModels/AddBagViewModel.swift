//
//  AddBagViewModel.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 26.03.2023.
//

import Foundation
import UIKit

struct AddBagViewModel {
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(title: String, stepValue: Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddBagViewModel {
    func onAddToBag() -> AddBagViewModel {
        return AddBagViewModel(title: self.title, stepValue: 1)
    }
    
    func onIncrement() -> AddBagViewModel {
        guard self.stepValue < 10 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> AddBagViewModel {
        guard self.stepValue > 0 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue - 1)
    }
}
