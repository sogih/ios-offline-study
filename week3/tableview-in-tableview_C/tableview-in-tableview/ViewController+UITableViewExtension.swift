import UIKit
import SnapKit

class ViewController : UIViewController {
    lazy var mainTableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .brown
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 400
//        tv.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCells")
        tv.register(cellType: MainTableViewCell.self)
        
        return tv
    }()
}


extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.className
    }
}


extension ViewController {
    func setupUI(){
        view.backgroundColor = .darkGray
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.leading.top.bottom.trailing.equalTo(view)
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with:MainTableViewCell.self, for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCells", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select MainTableViewCell - indexPath.row : \(indexPath.row)")
    }
}




public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}


extension NSObject: ClassNameProtocol {}

extension UITableView {
    
    func register<T:UITableViewCell>(cellType:T.Type) {
        
        let className = cellType.className
        register(cellType, forCellReuseIdentifier: className)
        
    }
    
    func dequeueReusableCell<T:UITableViewCell>(with type: T.Type, for indexPath:IndexPath) -> T {
        
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        
    }
}
