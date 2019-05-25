import UIKit

class SecondSubViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .black
        view.addSubview(button)
        
        // button
        button.setTitle("Back to RootVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        // navi
        title = "SecondSubViewController"
    }
    @objc func tappedButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
