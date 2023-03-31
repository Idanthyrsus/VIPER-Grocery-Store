import Foundation

struct AddBagViewModel {
    let skuId: String
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(skuId: String, title: String, stepValue: Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
        self.skuId = skuId
    }
}

extension AddBagViewModel {
    func onAddToBag() -> AddBagViewModel {
        return AddBagViewModel(skuId: self.skuId, title: self.title, stepValue: 1)
    }
    
    func onIncrement() -> AddBagViewModel {
        guard self.stepValue < 10 else { return self }
        return AddBagViewModel(skuId: self.skuId, title: self.title, stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> AddBagViewModel {
        guard self.stepValue > 0 else { return self }
        return AddBagViewModel(skuId: self.skuId, title: self.title, stepValue: self.stepValue - 1)
    }
}
