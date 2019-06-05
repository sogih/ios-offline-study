import UIKit
import SnapKit

class MainTableViewCell : UITableViewCell {
    
    lazy var label : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .green
        lb.textColor = .black
        lb.text = "MainTableViewCell"
        return lb
    }()
    
    lazy var subTableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .blue
        tv.delegate = self
        tv.dataSource = self
        tv.register(SubTableViewCell.self, forCellReuseIdentifier: "SubCells")
//        tv.rowHeight = UITableView.automaticDimension
        tv.rowHeight = 100
        tv.estimatedRowHeight = UITableView.automaticDimension
        return tv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MainTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .purple
        
        contentView.addSubview(subTableView)
        subTableView.snp.makeConstraints { (make) in
            make.leading.top.equalTo(contentView).offset(50)
            make.trailing.bottom.equalTo(contentView).offset(-50)
        }
        
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.leading.top.equalTo(contentView)
        }
    }
}


extension MainTableViewCell : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCells", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select SubTableViewCell - indexPath.row : \(indexPath.row)")
    }
}
