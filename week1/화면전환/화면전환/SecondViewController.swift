import UIKit

class SecondViewController: UIViewController {
    
    let buttonToDismiss = UIButton()
    let buttonToPresent = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .orange
        view.addSubview(buttonToDismiss)
        view.addSubview(buttonToPresent)
        
        // buttonToDismiss
        buttonToDismiss.setTitle("Back to FirstVC", for: .normal)
        buttonToDismiss.setTitleColor(.white, for: .normal)
        buttonToDismiss.translatesAutoresizingMaskIntoConstraints = false
        buttonToDismiss.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonToDismiss.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonToDismiss.addTarget(self, action: #selector(tappedButtonToDismiss), for: .touchUpInside)
        
        // buttonToPresent
        buttonToPresent.setTitle("Go to MainNVC", for: .normal)
        buttonToPresent.setTitleColor(.white, for: .normal)
        buttonToPresent.translatesAutoresizingMaskIntoConstraints = false
        buttonToPresent.topAnchor.constraint(equalTo: buttonToDismiss.bottomAnchor).isActive = true
        buttonToPresent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonToPresent.addTarget(self, action: #selector(tappedButtonToPresent), for: .touchUpInside)
    }
    
    @objc func tappedButtonToDismiss() {
        dismiss(animated: true)
    }
    
    @objc func tappedButtonToPresent() {
        let mainVC = UINavigationController(rootViewController: MainViewController())
        present(mainVC, animated: true)
    }
    
}
