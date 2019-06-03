import UIKit

class MainViewController: UIViewController {
    var todoList = [Todo](){
        didSet{
            self.tableView.reloadData()
        }
    }
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .gray
        tv.delegate = self
        tv.dataSource = self
//        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        return tv
    }()

}


//MARK:- Life Cycle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTableView()
    }
}


//MARK:- setupUI
extension MainViewController {
    func setupNavi() {
        let leftBarButtonToDelete = UIBarButtonItem(title: "삭제", style: .done, target: self, action: #selector(tappedLeftBarButtonToDelete))
        navigationItem.leftBarButtonItem = leftBarButtonToDelete
        let rightBarButtonToAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRightBarButtonToAdd))
        navigationItem.rightBarButtonItem = rightBarButtonToAdd
        navigationItem.title = "To Do"
        navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


//MARK:- Action & Event
extension MainViewController {
    @objc func tappedLeftBarButtonToDelete() {
        if !self.todoList.isEmpty { self.todoList.removeFirst() }
    }
    @objc func tappedRightBarButtonToAdd() {
        let alert = UIAlertController(title: "ToDo 추가하기", message: "추가할 메시지를 입력하세요.", preferredStyle: .alert)
        alert.addTextField()
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            let todoText = alert.textFields![0].text!
            let newTodo = Todo(todoText: todoText)
            self.todoList.append(newTodo)
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}


//MARK:- TableViewDelegate, DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        cell.todoLabel.text = self.todoList[indexPath.row].todoText
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subVC = SubViewController()
        subVC.todo = todoList[indexPath.row]
        navigationController?.pushViewController(subVC, animated: true)
    }
}
