import UIKit
import Foundation

class TableViewCell : UITableViewCell {
    
    static let cellId = "TableViewCell"
    
    let testLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "테이블 뷰 셀"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(testLabel)
        testLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

