import UIKit
import SnapKit
import Then
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let headerLabel = UILabel().then {
        $0.text = "🎵 Flo 🎵"
        $0.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.textAlignment = .center
    }
    
    
    let idTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.placeholder = "로그인 또는 등록할 아이디를 입력하세요."
        $0.autocapitalizationType = .none
    }
    
    
    let pwTextField = UITextField().then {
        $0.isSecureTextEntry = true
        $0.borderStyle = .roundedRect
        $0.placeholder = "로그인 또는 등록할 아이디의 비밀번호를 입력하세요."
    }
    
    
    let signinButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(tappedSigninButton), for: .touchUpInside)
    }
    
    
    let signupButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("회원가입", for: .normal)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
    }
    
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
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        Auth.auth().signIn(withEmail: idTextField.text!, password: pwTextField.text!) { (authResult, error) in
            if let err = error {
                alert.title = "error"
                alert.message = err.localizedDescription
                self.present(alert, animated: true)
            }
            
            if let result = authResult {
                let mainVC = MainViewController()
                self.present(mainVC, animated: true)
            }
        }
    }
    
    @objc func tappedSignupButton() {

        // 파이어베이스
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        print("dasfdsa")
        Auth.auth().createUser(withEmail: self.idTextField.text!, password: self.pwTextField.text!) { (authResult, error) in
//            print(authResult)
//            print(error?.localizedDescription)
            if let err = error {
                alert.title = "Error"
                alert.message = err.localizedDescription
            }
            
            if authResult != nil {
                alert.title = "success"
                alert.message = "로그인을 해주세요"
            }
            
            self.present(alert, animated: true)
            
        }
    }
}
