//
//  ViewModel.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/22.
//

import Foundation

protocol UserViewModelDelegate: AnyObject {
    func updateUserName(name: String)
    func updateUserAge(age: Int)
}

class UserViewModel {
    private var user: User
    weak var delegate: UserViewModelDelegate?
    
    init(user: User) {
        self.user = user
    }
    
    lazy var userName: String = user.name {
        didSet {
            delegate?.updateUserName(name: userName)
        }
    }
    
    lazy var userAge: Int = user.age {
        didSet {
            delegate?.updateUserAge(age: userAge)
        }
    }
}
