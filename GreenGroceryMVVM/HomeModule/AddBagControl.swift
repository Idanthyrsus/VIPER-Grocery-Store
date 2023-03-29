//
//  AddBagControl.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 26.03.2023.
//

import Foundation
import UIKit

class AddBagControl: UIControl {
    
    var viewModel: AddBagViewModel! {
        didSet {
            let isHidden = (viewModel.showStepper)
            addToBagButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepperLabel.isHidden = !isHidden
            stepperLabel.text = String(describing: viewModel.stepValue)
        }
    }
    
    var callback: BagClosure?
    
     lazy var addToBagButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(addToBag), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
     lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(incrementButton), for: .touchUpInside)
        return button
    }()
    
     lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(decrementButton), for: .touchUpInside)
        return button
    }()
    
     lazy var stepperLabel: UILabel = {
        let label = UILabel()
        label.text = String(describing: viewModel.stepValue)
        label.textColor = .black
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - selectors
    
    @objc func addToBag() {
        self.viewModel = self.viewModel.onAddToBag()
        self.callback?(viewModel.stepValue)
    }
    
    @objc func incrementButton() {
        self.viewModel = self.viewModel.onIncrement()
        self.callback?(viewModel.stepValue)
    }
    
    @objc func decrementButton() {
        self.viewModel = self.viewModel.onDecrement()
        self.callback?(viewModel.stepValue)
    }
    
    typealias BagClosure = (Int) -> ()
    
    func configure(usingViewModel viewModel: AddBagViewModel, bagClosure: @escaping BagClosure) {
        self.viewModel = viewModel
        self.addToBagButton.setTitle(viewModel.title, for: .normal)
        self.callback = bagClosure
    }
}
