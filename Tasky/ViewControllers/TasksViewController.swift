//
//  TasksViewController.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import UIKit

class TasksViewController: UIViewController {
    
    private var task: [String] = ["test1", "test2","test2","test2","test2" ]
    
    private lazy var taskTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        addGradientBackgrund()
        addSubViews()
        setupConstrants()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar(){
        navigationItem.hidesBackButton = true
    }
    private func addSubViews(){
        view.addSubview(taskTableView)
    }
    
    private func setupConstrants(){
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            
        ])
    }

}


extension TasksViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = task[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
