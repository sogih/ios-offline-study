//
//  ViewController.swift
//  TableView-2nd
//
//  Created by sogih on 03/06/2019.
//  Copyright © 2019 sogih. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CodingCustomTableViewCell.self, forCellReuseIdentifier: "CodingCustomTableViewCell")
        return tableview
    }()
}


//:MARK- Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//:MARK- setupUI
extension ViewController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // autoHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        // constraint
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}


//:MARK- protocol
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CodingCustomTableViewCell", for: indexPath) as? CodingCustomTableViewCell else { return UITableViewCell() }
        return cell
    }
}
