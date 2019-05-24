import UIKit

class FourthViewController: UIViewController {
    
    let button = UIButton()
    
    var buttonTitle : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        view.addSubview(button)
        self.title = "FourthViewController"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.setTitle(self.buttonTitle, for: .normal)
//        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        
        let fifthVC = FifthViewController()
        self.navigationController?.pushViewController(fifthVC, animated: true)
        
    }
}
