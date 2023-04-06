
import Foundation
import UIKit
import SnapKit

class GroceryItemCell: UITableViewCell {
    static let reuseIdentifier = "GroceryItemCell"
    let control = AddBagControl()
    let viewModel = AddBagViewModel(skuId: "1", title: "Add to bag", stepValue: 0)
 
    private lazy var groceryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .blue
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        control.configure(usingViewModel: viewModel) { _ in
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupElements()
        setupUI()
       
    }
    
    func setupElements() {
        self.contentView.addSubview(groceryImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(priceLabel)
       
        groceryImage.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.height.width.equalTo(50)
            make.leading.equalTo(self.contentView.snp.leading).offset(6)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(100)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom)
            make.height.equalTo(20)
            make.width.equalTo(280)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(6)
            make.height.equalTo(20)
            make.width.equalTo(60)
            make.leading.equalTo(groceryImage.snp.trailing).offset(3)
        }
    }
    
    func setupUI() {
        contentView.addSubview(control.addToBagButton)
        contentView.addSubview(control.plusButton)
        contentView.addSubview(control.minusButton)
        contentView.addSubview(control.stepperLabel)
        
        control.addToBagButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(50)
            make.trailing.equalTo(contentView.snp.trailing).offset(-3)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        
        control.minusButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(50)
            make.trailing.equalTo(contentView.snp.trailing).offset(-83)
            make.height.width.equalTo(40)
        }

        control.stepperLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(50)
            make.trailing.equalTo(control.plusButton.snp.leading)
            make.height.width.equalTo(40)
        }

        control.plusButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(50)
            make.trailing.equalTo(contentView.snp.trailing).offset(-3)
            make.height.width.equalTo(40)
        }
    }
    
    func configure(using viewModel: GroceryItemViewModel, addToCartClosure: @escaping BagClosure) {
         self.nameLabel.text = viewModel.title
         self.groceryImage.image = UIImage(named: viewModel.image)
         self.descriptionLabel.text = viewModel.details
         self.priceLabel.text = viewModel.price
         self.control.configure(usingViewModel: AddBagViewModel(skuId: viewModel.id, title: "Add to bag", stepValue: 0), bagClosure: addToCartClosure)
         self.selectionStyle = .none
     }}
