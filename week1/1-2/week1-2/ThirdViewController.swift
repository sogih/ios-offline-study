import UIKit

class ThirdViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tappedLeftBarButton))
        
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(title: "Right", style: .done, target: self, action: #selector(tappedRightBarButton))
        
        navigationItem.rightBarButtonItem = rightBarButton
        
        self.title = "ThirdViewController"
        
        view.backgroundColor = .red
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        
        let fourthVC = FourthViewController()
        fourthVC.buttonTitle = "데이터전달"
//        fourthVC.button.setTitle("데이터전달(from third)", for: .normal)
        self.navigationController?.pushViewController(fourthVC, animated: true)
        
    }
    
    @objc func tappedLeftBarButton() {
        print("tapped left bar")
    }
    
    @objc func tappedRightBarButton() {
        print("tapped right bar")
    }
}
