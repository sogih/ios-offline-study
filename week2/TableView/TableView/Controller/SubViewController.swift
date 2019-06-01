import UIKit

class SubViewController: UIViewController {
    var todo = [String]
}



//MARK:- Life Cycle
extension SubViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}



//MARK:- Setup UI
extension SubViewController {
    func setupUI() {
        view.backgroundColor = .gray
        let label = UILabel()
        view.addSubview(label)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}
