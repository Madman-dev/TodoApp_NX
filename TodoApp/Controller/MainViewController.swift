//
//  MainViewController.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/13.
//

import UIKit

class MainViewController: UIViewController {
    var checkTodoButton: UIButton = {
        let button = UIButton()
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(todoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var checkCompletedTodo: UIButton = {
        let button = UIButton()
        button.setTitle("완료한 일 확인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(completedTodoTapped), for: .touchUpInside)
        return button
    }()
    
    var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 페이지 확인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var userCheckButton: UIButton = {
        let button = UIButton()
        button.setTitle("유저 정보", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(userCheckButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUI()
        getFontName()
    }
    
    private func setUI() {
        [checkTodoButton, checkCompletedTodo, profileButton, userCheckButton].forEach{view.addSubview($0)}
        setButton()
    }
    
    private func setButton() {
        NSLayoutConstraint.activate([
            checkTodoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkTodoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            checkCompletedTodo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkCompletedTodo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            userCheckButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userCheckButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
        ])
    }
    
    @objc func todoButtonTapped() {
        print("투두 버튼이 눌렸습니다.")
        let viewControllerClassToCheck = TodoViewController.self
        
        if let existingVC = navigationController?.viewControllers.first(where: {$0.isKind(of: viewControllerClassToCheck)}) {
            navigationController?.pushViewController(existingVC, animated: true)
        } else {
            let newVC = viewControllerClassToCheck.init()
            navigationController?.pushViewController(newVC, animated: true)
        }
    }

    @objc func completedTodoTapped() {
        print("완료 버튼이 눌렸습니다.")
        let viewControllerToCheck = FinishedController.self
        
        if let existingVC = navigationController?.viewControllers.first(where: {$0.isKind(of: viewControllerToCheck)}) {
            navigationController?.pushViewController(existingVC, animated: true)
        } else {
            let newVC = viewControllerToCheck.init()
            navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    @objc func profileButtonTapped() {
        print("프로필 페이지 눌렸습니다.")
        
        let viewControllerToCheck = ProfileDesignViewController.self
        
        if let existingVC = navigationController?.viewControllers.first(where: {$0.isKind(of: viewControllerToCheck)}) {
            navigationController?.pushViewController(existingVC, animated: true)
        } else {
            let newVC = viewControllerToCheck.init()
            newVC.modalPresentationStyle = .fullScreen
            present(newVC, animated: true)
        }
    }
    
    @objc func userCheckButtonTapped() {
        print("유저 버튼이 눌렸습니다.")
        
        let user = User(name: "이동준", age: 30)
        let viewModel = UserViewModel(user: user)
        let view = View(viewModel: viewModel)
        present(view, animated: true)
    }
    
    deinit {
        print("MainViewController이 화면에서 사라졌습니다.")
    }
}
