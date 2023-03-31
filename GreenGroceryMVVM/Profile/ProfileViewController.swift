
import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "Profile"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
}
