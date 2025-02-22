//
//  TasksTableViewHeader.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import UIKit

protocol TaskTableViewHeaderDelegate: AnyObject {
    func didTapAddTaskButton()
}

class TasksTableViewHeader: UIView {
    
    weak var delegate : TaskTableViewHeaderDelegate?

    private lazy var titleLabel : UILabel = {
        let label = UILabel( )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tarefas"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkPurple 
        label.textAlignment = .center
        return label
    }( )
    
    private lazy var addTaskButton : UIButton = {
        let button = UIButton( )
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = UIImage(systemName: "plus")
        button.setImage(plusImage, for: .normal)
        button.addTarget(self, action: #selector(didTapAddTaskButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: functions config view
    
    
    private func addSubviews(){
        addSubview(titleLabel)
        addSubview(addTaskButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    //MARK: Functions components
    
    @objc   func didTapAddTaskButton(){
        delegate?.didTapAddTaskButton()
    }
    

}
