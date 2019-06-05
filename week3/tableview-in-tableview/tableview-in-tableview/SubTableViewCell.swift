import UIKit
import SnapKit

class SubTableViewCell : UITableViewCell {
    lazy var label : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .gray
        lb.textColor = .black
        lb.text = "SubTableViewCell"
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SubTableViewCell {
    func setupUI() {
        
        contentView.backgroundColor = .darkGray
        
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
        }
    }
}
