import UIKit

class MainViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .green
        view.addSubview(button)
        
        // navi
        self.title = "MainViewController"
        let leftBarButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(tappedLeftBarButton))
        navigationItem.leftBarButtonItem = leftBarButton
        
        // button
        button.setTitle("Go to FirstSVC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        let firstSVC = FirstSubViewController()
        self.navigationController?.pushViewController(firstSVC, animated: true)
    }
    
    @objc func tappedLeftBarButton() {
        dismiss(animated: true)
    }
    
    
}
