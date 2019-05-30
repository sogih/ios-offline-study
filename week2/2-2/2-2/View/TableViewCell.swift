import UIKit

class TableViewCell: UITableViewCell{
    
    static let cellId = "TableViewCell"
    
    let todoLable : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:-
extension TableViewCell {
    func setupUI() {
        
        contentView.addSubview(todoLable)
        
        todoLable.translatesAutoresizingMaskIntoConstraints = false
        todoLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        todoLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
}
