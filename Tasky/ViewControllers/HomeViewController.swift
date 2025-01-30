//
//  ViewController.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var mainIlustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.homeIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var getReadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prepare-se para consquistat o dia, uma lista de cada vez"
        label.textColor = UIColor(named: Colors.darkPurple)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Vamos Comerçar!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18   , weight: .bold)
        button.backgroundColor = UIColor(named: Colors.darkPurple)
        button.layer.cornerRadius = 12.6
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapStartedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackgrund()
        addSubViews()
        setupConstrants()
    }
    
    private func addSubViews(){
        view.addSubview(logoImageView)
        view.addSubview(mainIlustrationImageView)
        view.addSubview(getReadyLabel)
        view.addSubview(getStartedButton)
    }
    
    private func setupConstrants(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainIlustrationImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8.0),
            mainIlustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getReadyLabel.topAnchor.constraint(equalTo: mainIlustrationImageView.bottomAnchor,constant: 32),
            getReadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor  ,constant: 26),
            getReadyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor  ,constant: -26),
            
            getStartedButton.topAnchor.constraint(equalTo: getReadyLabel.bottomAnchor, constant: 32),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 162.0),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44.0),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
        ])
    }
    
    
    @objc func didTapStartedButton()  {
        navigationController?.pushViewController(TasksViewController( ), animated: true)
    }


}

