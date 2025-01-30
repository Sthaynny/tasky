//
//  TasksViewController.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import UIKit

protocol TaskDelegate: AnyObject {
    func didAddTask(newTask: Task)
}

class TasksViewController: UIViewController {
     
    private var taskRepository: TaskRepository
    
 
    private lazy var taskTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.layer.cornerRadius = 24
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        header.delegate = self
        table.tableHeaderView = header
        
        return table
    }()
    
    private lazy var tasklIlustrationImageView:UIImageView = {
        let ilustration = UIImageView(image: UIImage(named: AssetsConstants.tasksIllustration))
        ilustration.translatesAutoresizingMaskIntoConstraints = false
        ilustration.contentMode = .scaleAspectFit
        return ilustration
    }( )
    
    
    private func createTaskCheckmarkButton(task: Task) -> UIButton {
        let completeButton = UIButton(type: .system)
        completeButton.addTarget(self, action: #selector(didTapCompleteTaskButton), for: .touchUpInside)
        let symbolName = task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        completeButton.setImage(image, for: .normal)
        completeButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return completeButton
    }
    
    init(taskRepository: TaskRepository = TaskRepository()) {
        self.taskRepository = taskRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    
    @objc func didTapCompleteTaskButton(_ sender: UIButton) {
        guard let cell = sender.superview as? UITableViewCell else { return }
        guard let indexPath = taskTableView.indexPath(for: cell) else { return }
        taskRepository.completeTask(at: indexPath.row)
        taskTableView.reloadRows(at: [indexPath], with: .automatic)
    }

}


extension TasksViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskRepository.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        let task = taskRepository.tasks[indexPath.row]
        content.text = task.title
        content.secondaryText = task.description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckmarkButton(task: task)
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
            taskRepository.removeTask(at: indexPath.row)
            taskTableView.reloadData()
        }
    }
    
}


extension TasksViewController: TaskTableViewHeaderDelegate{
    func didTapAddTaskButton() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.delegate = self
        navigationController?.present(addTaskVC, animated: true)
    }
}


extension TasksViewController: TaskDelegate{
    func didAddTask(newTask: Task) {
        taskRepository.addTask(newTask)
        taskTableView.reloadData()
    }
}
