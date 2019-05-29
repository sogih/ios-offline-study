import UIKit

class FirstViewController: UIViewController {
    
    // present button - 클로저를 이용한 저장 프로퍼티 초기화
    let button : UIButton = {
        let btn = UIButton()
        btn.setTitle("present", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
}


//MARK: UI
extension FirstViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

//MARK: Action
extension FirstViewController {
    @objc func tappedButton() {
        let secondVC = SecondViewController()
        secondVC.value = "데이터 전달 from VC1 -> VC2"
        present(secondVC, animated: true)
    }
}

extension FirstViewController : SecondViewControllerDelegate {
    func sendResultData(value : String) {
        print(value)
    }
}
