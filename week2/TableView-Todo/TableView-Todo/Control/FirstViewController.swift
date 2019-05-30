import UIKit

class FirstViewController: UIViewController {
    
}


//MARK:- Life Cycle
extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTableView()
    }
    
}


//MARK:- Setup UI
extension FirstViewController {
    
    func setupNavi() {
        let leftButtonToDelete = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(tappedLeftButtonToDelete))
        let rightButtonToAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRightButtonToAdd))
        
        self.navigationItem.leftBarButtonItem = leftButtonToDelete
        self.navigationItem.rightBarButtonItem = rightButtonToAdd
        self.navigationItem.title = "To Do List"
    }
    
    func setupTableView() {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
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
    
    @objc func tappedLeftButtonToDelete() {
    }
    
    @objc func tappedRightButtonToAdd() {
        let alertController = UIAlertController(title: "Write a To do", message: "Please enter your work today.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Add", style: .default) { (_) in
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.addTextField()
        present(alertController, animated: true)
    }
    
}


//MARK:- TableView protocol
extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

