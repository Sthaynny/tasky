//
//  TasksViewController.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import UIKit

class TasksViewController: UIViewController {
     
    
    private lazy var taskTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.layer.cornerRadius = 24
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        table.tableHeaderView = header
        
        return table
    }()
    
    private lazy var tasklIlustrationImageView:UIImageView = {
        let ilustration = UIImageView(image: UIImage(named: AssetsConstants.tasksIllustration))
        ilustration.translatesAutoresizingMaskIntoConstraints = false
        ilustration.contentMode = .scaleAspectFit
        return ilustration
    }( )

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
        view.addSubview(tasklIlustrationImageView)
        view.addSubview(taskTableView)
    }
    
    private func setupConstrants(){
        NSLayoutConstraint.activate([
            tasklIlustrationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tasklIlustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            taskTableView.topAnchor.constraint(equalTo: tasklIlustrationImageView.bottomAnchor),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ),
            
        ])
    }

}


extension TasksViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        let task = tasks[indexPath.row]
        content.text = task.title
        content.secondaryText = task.description ?? ""
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Toque no botão de remover")
        }
    }
    
}
