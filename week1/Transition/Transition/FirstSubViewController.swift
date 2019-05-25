import UIKit

class FirstSubViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .blue
        view.addSubview(button)
        
        // button
        button.setTitle("Go to SeconSVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        // navi
        title = "FirstSubViewController"
    }

    @objc func tappedButton() {
        let secondSVC = SecondSubViewController()
        navigationController?.pushViewController(secondSVC, animated: true)
    }
    
}
