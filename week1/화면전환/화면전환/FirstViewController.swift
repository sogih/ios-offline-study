import UIKit

class FirstViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view 속성
        view.backgroundColor = .red
        view.addSubview(button)
        
        // button 속성
        button.setTitle("Go to SecondVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
    }
    
    @objc func tappedButton() {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }
}
