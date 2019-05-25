import UIKit

class FirstViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .red
        view.addSubview(button)
        
        // button
        button.setTitle("Go to SecondVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    @objc func tappedButton() {
        let SecondVC = SecondViewController()
        present(SecondVC, animated: true)
    }
}
