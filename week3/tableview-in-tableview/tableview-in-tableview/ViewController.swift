import UIKit
import SnapKit

class ViewController : UIViewController {
    lazy var mainTableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .brown
        tv.delegate = self
        tv.dataSource = self
//        tv.rowHeight = UITableView.automaticDimension
        tv.rowHeight = 400
        tv.estimatedRowHeight = UITableView.automaticDimension
        tv.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCells")
        return tv
    }()
}


extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCells", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select MainTableViewCell - indexPath.row : \(indexPath.row)")
    }
}
