import UIKit

class MainViewController: UIViewController {
    var todoList = [Todo](){
        didSet{
//            self.tableView.reloadData()
        }
    }
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
        let leftBarButtonToDelete = UIBarButtonItem(title: "뒤로", style: .done, target: self, action: #selector(tappedLeftBarButtonToDelete))
        navigationItem.leftBarButtonItem = leftBarButtonToDelete
        let rightBarButtonToAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRightBarButtonToAdd))
        navigationItem.rightBarButtonItem = rightBarButtonToAdd
        
    }
    func setupTableView() {
        let tableView = UITableView()
        tableView.backgroundColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cell)
        
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
        
    }
    @objc func tappedRightBarButtonToAdd() {
        let alert = UIAlertController(title: "ToDo 추가하기", message: "추가할 메시지를 입력하세요.", preferredStyle: .alert)
        alert.addTextField()

        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            let todo = alert.textFields![0]
//            print(todo)
//            self.todoList.append(todo)

        }
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}


//MARK:-
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
