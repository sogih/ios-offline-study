import UIKit

class SecondViewController: UIViewController {
    
    let buttonToPresent = UIButton()
    let buttonToDismiss = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .orange
        view.addSubview(buttonToPresent)
        view.addSubview(buttonToDismiss)
        
        // button - present
        buttonToPresent.setTitle("Go to MainVC", for: .normal)
        buttonToPresent.setTitleColor(.white, for: .normal)
        buttonToPresent.translatesAutoresizingMaskIntoConstraints = false
        buttonToPresent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonToPresent.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonToPresent.addTarget(self, action: #selector(tappedButtonToPresent), for: .touchUpInside)
        
        // button - dismiss
        buttonToDismiss.setTitle("Back to FirstVC", for: .normal)
        buttonToDismiss.setTitleColor(.white, for: .normal)
        buttonToDismiss.translatesAutoresizingMaskIntoConstraints = false
        buttonToDismiss.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonToDismiss.topAnchor.constraint(equalTo: buttonToPresent.bottomAnchor).isActive = true
        buttonToDismiss.addTarget(self, action: #selector(tappedButtonToDismiss), for: .touchUpInside)
    }
    @objc func tappedButtonToPresent() {
        let mainVC = UINavigationController(rootViewController: MainViewController())
        present(mainVC, animated: true)
    }
    
    @objc func tappedButtonToDismiss() {
        dismiss(animated: true)
    }
}
