import UIKit
import SnapKit
import CoreData

class MainViewController: UIViewController {
    
    let cellId = "cellId"
    
    lazy var tableView : UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        tv.backgroundColor = .white
        tv.rowHeight = 100
        return tv
        
    }()

    var todoList = [TodoList]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
}

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        fetchTodoList()
    }
    
}


extension MainViewController {
    
    func setupUI() {
        
        setupNavigation()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupNavigation() {
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedRigtBarButton))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
}

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        cell.todoLabel.text = self.todoList[indexPath.row].todo
        cell.dataLabel.text = self.todoList[indexPath.row].designatedDate?.description
        
        if todoList[indexPath.row].isDone == true {
            cell.backgroundColor = .darkGray
        }
        if todoList[indexPath.row].isDone == false {
            cell.backgroundColor = .white
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        updateTodo(indexPathRow: indexPath.row)
        deleteTodo(indextPathRow: indexPath.row)
        tableView.reloadData()
    }
}



extension MainViewController {
    @objc func tappedRigtBarButton() {
        let alert = UIAlertController(title: "add", message: "add todo", preferredStyle: .alert)
        alert.addTextField { (tf) in
            
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            self.saveTodo(todo: (alert.textFields?[0].text)!)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func saveTodo(todo: String) {
        
        let todoList = TodoList(context: CoreDataService.context)
        
        todoList.todo = todo
        todoList.isDone = false
        todoList.designatedDate = Date()
        todoList.dateType = 0
        CoreDataService.saveContext()
        
        self.todoList.append(todoList)
    }
    
    func fetchTodoList() {
        
        let fetchRequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        do {
            let todoList = try CoreDataService.context.fetch(fetchRequest)
            self.todoList = todoList
            
            for todo in todoList {
                print(todo.isDone)
            }
            
        } catch { }
        
    }
    
    func updateTodo(indexPathRow: Int) {
        
        let fetchRequest: NSFetchRequest<TodoList> = NSFetchRequest(entityName: "TodoList")
        
        do {
            let objects = try CoreDataService.context.fetch(fetchRequest)
            let object = objects[indexPathRow]
            
//            object.setValue(true, forKey: "isDone")
//            CoreDataService.saveContext()
//            todoList[indexPathRow].isDone = true
            
//            if todoList[indexPathRow].isDone == true {
//                object.setValue(false, forKey: "isDone")
//            } else {
//                object.setValue(true, forKey: "isDone")
//            }
            
            //삼항연산자
//            let bool = todoList[indexPathRow].isDone ? false : true
//            object.setValue(bool, forKey: "isDone")
            
            object.setValue(!todoList[indexPathRow].isDone, forKey: "isDone")
            
            CoreDataService.saveContext()
            self.tableView.reloadData()
        } catch {
            
        }
        
    }
    
    func deleteTodo(indextPathRow: Int) {
        
        let fetchRequest: NSFetchRequest<TodoList> = NSFetchRequest(entityName: "TodoList")
        //<=>
        //let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        do {
            let todoList = try CoreDataService.context.fetch(fetchRequest)
            CoreDataService.context.delete(todoList[indextPathRow])
            CoreDataService.saveContext() //생략가능
        } catch {}
        
    }
    
    
}

