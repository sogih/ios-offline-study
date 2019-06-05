import UIKit

class CodingCustomTableViewCell: UITableViewCell {
    // imageView 생성
    let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon.jpg")
        return imgView
    }()
    
    // label 생성
    let label: UILabel = {
        let label = UILabel()
        label.text = "아기사자"
        label.textColor = UIColor.gray
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

extension CodingCustomTableViewCell {
    func setupUI() {
        contentView.addSubview(img)
        contentView.addSubview(label)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        img.widthAnchor.constraint(equalToConstant: 128).isActive = true
        img.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        label.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        label.centerYAnchor.constraint(equalTo: img.centerYAnchor).isActive = true
    }
}
