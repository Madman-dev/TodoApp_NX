//
//  View.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/22.
//

import UIKit

class View: UIViewController {
    
    private var viewModel: UserViewModel
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "기본 이름"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "기본 나이"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewUserbutton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("떡국 먹기", for: .normal)
        button.addTarget(self, action: #selector(viewUserButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        // 이 친구는 어떤 차이점이 있는걸까?
        super.init(nibName: nil, bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.view.backgroundColor = .yellow
        self.nameLabel.text = viewModel.userName
        self.ageLabel.text = String("현재 나이: \(viewModel.userAge)")
        updateLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewUserButtonTapped() {
        print("나이 먹기 버튼이 눌렸습니다.")
        viewModel.userAge += 1
    }
    
    func updateLayout() {
        self.view.addSubview(nameLabel)
        self.view.addSubview(ageLabel)
        self.view.addSubview(viewUserbutton)
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            viewUserbutton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            viewUserbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension View: UserViewModelDelegate {
    func updateUserAge(age: Int) {
        DispatchQueue.main.async {
            self.ageLabel.text = String("현재 나이: \(age)")
        }
    }
    
    func updateUserName(name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
}
