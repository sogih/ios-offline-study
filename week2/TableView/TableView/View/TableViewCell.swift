import UIKit

class TableViewCell: UITableViewCell {
    
    static let cellId = "TableViewCell"
    let todoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TableViewCell {
    func setupUI() {
        contentView.backgroundColor = .gray
        contentView.addSubview(todoLabel)
        todoLabel.textColor = .white
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        todoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        todoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24).isActive = true
        todoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
