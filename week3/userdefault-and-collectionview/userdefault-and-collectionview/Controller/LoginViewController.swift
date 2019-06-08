import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let headerLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "🎵 Flo 🎵"
        lbl.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.textAlignment = .center
        return lbl
    }()
    
    let idTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "로그인 또는 등록할 아이디를 입력하세요."
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let pwTextField : UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        tf.placeholder = "로그인 또는 등록할 아이디의 비밀번호를 입력하세요."
        return tf
    }()
    
    let signinButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("로그인", for: .normal)
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedSigninButton), for: .touchUpInside)
        return btn
    }()
    
    let signupButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("회원가입", for: .normal)
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
        return btn
    }()
    
}



//MARK:- life cycle
extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK:- setup ui
extension LoginViewController {
    func setupUI() {
        
        // view
        view.backgroundColor = .white
        
        // welcome text
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(44)
        }
        
        // pw text field
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalTo(view).offset(24)
            $0.trailing.equalTo(view).offset(-24)
            $0.height.equalTo(44)
        }
        
        // id text field
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(pwTextField.snp_topMargin).offset(-24)
            $0.leading.trailing.height.equalTo(pwTextField)
        }
        
        // sign in button
        view.addSubview(signinButton)
        signinButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp_bottomMargin).offset(24)
            $0.leading.height.equalTo(pwTextField)
            $0.trailing.equalTo(pwTextField.snp_centerXWithinMargins).offset(-12)
        }
        
        // sign up button
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints {
            $0.top.height.equalTo(signinButton)
            $0.leading.equalTo(signinButton.snp_trailingMargin).offset(24)
            $0.trailing.equalTo(view).offset(-24)
        }
    }
}


//MARK:- action event
extension LoginViewController {
    
    @objc func tappedSigninButton() {
        
        if idTextField.text == UserDefaults.standard.string(forKey: "id") && pwTextField.text == UserDefaults.standard.string(forKey: "pw") {
            let mainVC = MainViewController()
            present(mainVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Failed!", message: "😭 아이디 또는 비밀번호를 확인해주세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
        
    }
    
    @objc func tappedSignupButton() {
        // save id pw data
        UserDefaults.standard.set(self.idTextField.text, forKey: "id")
        UserDefaults.standard.set(self.pwTextField.text, forKey: "pw")
        
        // alert
        let alert = UIAlertController(title: "Registered!", message: "😍 회원가입이 완료되었습니다~!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
