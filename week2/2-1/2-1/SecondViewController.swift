import UIKit

protocol SecondViewControllerDelegate : class {
    func sendResultData(value : String)
}

class SecondViewController: UIViewController {
    
    weak var delegate : SecondViewControllerDelegate?
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("dismiss", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
    
    var value: String = ""
    
}

extension SecondViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        self.button.setTitle(self.value, for: .normal)
    }
    
    func setupUI() {
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

//MARK:-- action
extension SecondViewController {
    @objc func tappedButton() {
        dismiss(animated: true) {
            self.delegate?.sendResultData(value: "받으세요")
        }
    }
}
