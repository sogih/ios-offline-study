import UIKit
import SnapKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    let idTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.placeholder = "email"
        return tf
    }()
    
    let pwTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.placeholder = "password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let signinButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign In", for: .normal)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 6
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let signupButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 6
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let indicator : UIActivityIndicatorView = {
        let idc = UIActivityIndicatorView()
        idc.style = .whiteLarge
        idc.hidesWhenStopped = true
        idc.color = .red
        return idc
    }()
}



//MARK:- life cycle
extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        autoLogin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}


//MARK:- auto login
extension LoginViewController {
    func autoLogin() {
        
        guard let lastSignInDate = UserDefaults.standard.object(forKey: "lastSignInDate") as? Date else { return }
        let thirtyDaysAgoSinceNow = Date(timeIntervalSinceNow: -2592000)
        
        if lastSignInDate >= thirtyDaysAgoSinceNow {
            let mainVC = MainViewController()
            
            DispatchQueue.main.async {
                self.present(mainVC, animated: true)
            }
        }
    }
}


//MARK:- setup ui
extension LoginViewController {
    func setupUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(44)
        }
        
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints {
            $0.leading.trailing.height.equalTo(idTextField)
            $0.top.equalTo(idTextField.snp_bottomMargin).offset(24)
        }
        
        view.addSubview(signinButton)
        signinButton.snp.makeConstraints {
            $0.leading.trailing.height.equalTo(idTextField)
            $0.top.equalTo(pwTextField.snp_bottomMargin).offset(24)
        }
        signinButton.addTarget(self, action: #selector(tappedSigninButton), for: .touchUpInside)
        
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints {
            $0.leading.trailing.height.equalTo(idTextField)
            $0.top.equalTo(signinButton.snp_bottomMargin).offset(24)
        }
        signupButton.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
}

//MARK:- event action
extension LoginViewController {
    
    @objc func tappedSigninButton() {
        
        self.indicator.startAnimating()
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "okay", style: .default)
        alert.addAction(ok)
        
        Auth.auth().signIn(withEmail: idTextField.text!, password: pwTextField.text!) { authResult, error in
            
            if error != nil {
                self.indicator.stopAnimating()
                alert.title = "Fail"
                alert.message = error?.localizedDescription
                self.present(alert, animated: true, completion: nil)
            }
            
            if authResult != nil {
                UserDefaults.standard.set(authResult?.user.metadata.lastSignInDate, forKey: "lastSignInDate")
                
                //save data in singleton class
                AuthResult.user.displayName = authResult?.user.displayName
                AuthResult.user.email = authResult?.user.email
                AuthResult.user.creationDate = authResult?.user.metadata.creationDate
                AuthResult.user.lastSignInDate = authResult?.user.metadata.lastSignInDate
                
                let mainVC = MainViewController()
                self.indicator.stopAnimating()
                self.present(mainVC, animated: true, completion: nil)
            }
        }
    }
    
    @objc func tappedSignupButton() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "okay", style: .default)
        alert.addAction(ok)
        
        Auth.auth().createUser(withEmail: self.idTextField.text!, password: self.pwTextField.text!) { authResult, error in
            if error != nil {
                alert.title = "Fail"
                alert.message = error?.localizedDescription
            }
            if authResult != nil {
                alert.title = "Success"
                alert.message = "signed up"
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
