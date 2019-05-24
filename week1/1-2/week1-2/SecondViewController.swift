import UIKit

class SecondViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        
        
        
    }
}
