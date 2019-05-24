import UIKit

class FifthViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(button)
        self.title = "FifthViewController"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let rightBarButton = UIBarButtonItem(title: "go to rootviewController", style: .done, target: self, action: #selector(tappedRightBarButton))
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        
    }
    
    @objc func tappedRightBarButton() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}

