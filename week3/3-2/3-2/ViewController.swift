import UIKit
import SnapKit

class ViewController: UIViewController {

    let idField : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
    }()
    
    let pwField : UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        return tf
    }()
    
    let loginButton : UIButton = {
        let bt = UIButton()
        bt.setTitle("OK", for: .normal)
        return bt
    }()
}

//MARK:- life cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
    }
}

//MARK:- setup ui
extension ViewController {
    func setupUI() {
        view.addSubview(idField)
        idField.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(44)
        }
        view.addSubview(pwField)
        pwField.snp.makeConstraints { (make) in
            make.top.equalTo(idField.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(44)
        }
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwField.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(44)
        }
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }
}


//MARK:- Action & event
extension ViewController {
    @objc func tappedLoginButton() {
        print("👍")
        //save data to UserDefault
        UserDefaults.standard.set(self.idField.text, forKey: "id")
        UserDefaults.standard.set(self.pwField.text, forKey: "pw")
    }
}
