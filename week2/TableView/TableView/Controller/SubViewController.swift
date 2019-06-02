import UIKit

class SubViewController: UIViewController {
    var todo = Todo(todoText: "")
    let label = UILabel()
    let textField = UITextField()
}



//MARK:- Life Cycle
extension SubViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}



//MARK:- Setup UI
extension SubViewController {
    func setupUI() {
        view.backgroundColor = .gray
        navigationItem.title = todo.todoText
        
        view.addSubview(textField)
        textField.placeholder = "'\(todo.todoText)'에 대한 상세 내용을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -12).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.textColor = .white
    }
}


//MARK:- Action & Event
extension SubViewController {
    @objc func tappedButton() {
        label.text = self.textField.text
    }
}
