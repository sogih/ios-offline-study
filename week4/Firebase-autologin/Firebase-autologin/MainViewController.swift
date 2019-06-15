import UIKit

class MainViewController: UIViewController {
    let label : UILabel = {
        let lbl = UILabel()
        lbl.text = "main view controller (completed sign in)"
        lbl.textColor = .white
        lbl.backgroundColor = .darkGray
        lbl.layer.cornerRadius = 6
        lbl.layer.masksToBounds = true
        lbl.textAlignment = .center
        return lbl
    }()
    
    let logoutButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Log out", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 6
        btn.layer.masksToBounds = true
        return btn
    }()
}


//MARK:- life cycle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK:- setup ui
extension MainViewController {
    func setupUI() {
        view.backgroundColor = .gray
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints {
            $0.centerX.height.equalTo(label)
            $0.top.equalTo(label.snp_bottomMargin).offset(24)
        }
        logoutButton.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
    }
}

//MARK:- event action
extension MainViewController {
    @objc func tappedLogoutButton() {
        UserDefaults.standard.set(Date(timeIntervalSinceNow: -2592060), forKey: "lastSignInDate")
        self.dismiss(animated: true, completion: nil)
    }
}
