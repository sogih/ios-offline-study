import UIKit

class FirstViewController: UIViewController {
    
    var todoList = [Todo](){
        
        didSet{
            self.tableView.reloadData()
        }
        
    }
    
    lazy var tableView : UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        return tv
    }()
    
}


//MARK:- LifeCycle
extension FirstViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavi()
        setupUI()
    }
}


//MARK:- Setup UI
extension FirstViewController {
    
    func setupNavi() {
        let leftBarButton = UIBarButtonItem(title: "삭제", style: .done, target: self, action: #selector(tappedLeftBarButton))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRightBarButton))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    func setupUI() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}


//MARK:- Action & Event
extension FirstViewController {
    
    @objc func tappedLeftBarButton() {
        print("삭제누름")
        if !self.todoList.isEmpty { self.todoList.removeFirst() }
    }
    
    @objc func tappedRightBarButton() {
        print("더하기 누름")
        showAlert(title: "추가", message: "todo를 추가합니다")
    }
    
    func showAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField()
        let textField = alertController.textFields![0]
        let doneButton = UIAlertAction(title: "확인", style: .default) { (_) in
            let todoText = textField.text!
            print(todoText)
            let newTodo = Todo(todoText: todoText, date: Date().description)
            self.todoList.append(newTodo)
//            self.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "취소", style: .destructive)
        alertController.addAction(doneButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
}


extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        cell.todoLable.text = self.todoList[indexPath.row].todoText
        return cell
    }
    
}
