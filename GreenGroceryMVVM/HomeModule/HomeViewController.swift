//
//  ViewController.swift
//  GreenGroceryMVVM
//
//  Created by Alexander Korchak on 26.03.2023.
//

import UIKit
import SnapKit

protocol HomeView: AnyObject {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
}

class HomeViewController: UIViewController {
    var list: [GroceryItemViewModel] = []
    let control = AddBagControl()
    let viewModel = AddBagViewModel(title: "Add to bag", stepValue: 1
    )
    var presenter: HomePresentation?
 
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(GroceryItemCell.self, forCellReuseIdentifier: GroceryItemCell.reuseIdentifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        setupUIElements()
        presenter?.viewDidLoad()
    }
    
    func setupUIElements() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: HomeView {
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        self.list = groceriesList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
        print("grocery list \(groceriesList)")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroceryItemCell.reuseIdentifier, for: indexPath) as? GroceryItemCell else {
            return UITableViewCell()
        }
        
        let viewModel = list[indexPath.row]
       
        cell.configure(using: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

