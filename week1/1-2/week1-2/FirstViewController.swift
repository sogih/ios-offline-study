import UIKit

class FirstViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
    
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        
//        let secondVC = SecondViewController()
//        present(secondVC, animated: true) {
//            print("successfully present")
//        }
        
        self.navigationController?.popViewController(animated: true)
    
    }
    
}
