import UIKit

class MainViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .green
        view.addSubview(button)
        
        // buttonToPush
        button.setTitle("Go to FirstSVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        // navi
        title = "MainViewController"
        let barButton = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(tappedBarButton))
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func tappedButton() {
        let firstSVC = FirstSubViewController()
        navigationController?.pushViewController(firstSVC, animated: true)
    }
    
    @objc func tappedBarButton() {
        dismiss(animated: true)
    }
    
}
