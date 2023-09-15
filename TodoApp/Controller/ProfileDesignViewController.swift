//
//  ProfileDesignViewController.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/14.
//

import UIKit
import SwiftUI

class ProfileDesignViewController: UIViewController {
    
    lazy var rightItem: UIBarButtonItem = {
        let image = UIImage(systemName: "line.3.horizontal")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(sideBarTapped))
        return button
    }()
    
    var profileImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        iv.image = image
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2
        iv.layer.borderColor = UIColor.black.cgColor
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var postNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var postLabel: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy var postStack: UIStackView = {
        let stack = UIStackView()
        [postNumber, postLabel].forEach{stack.addArrangedSubview($0)}
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var followerNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy var followerStack: UIStackView = {
        let stack = UIStackView()
        [followerNumber, followerLabel].forEach{stack.addArrangedSubview($0)}
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var followingNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy var followingStack: UIStackView = {
        let stack = UIStackView()
        [followingNumber, followingLabel].forEach{stack.addArrangedSubview($0)}
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var countStack: UIStackView = {
        let stack = UIStackView()
        [postStack, followerStack, followingStack].forEach{stack.addArrangedSubview($0)}
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var profileName: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileDescription: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer 🐥"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileUrl: UILabel = {
        let label = UILabel()
        label.text = "https://github.com/Madman-dev"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var profileStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        [profileName, profileDescription, profileUrl].forEach{stack.addArrangedSubview($0)}
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .blue
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var dropDownButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.down")
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        [followButton, messageButton, dropDownButton].forEach{stack.addArrangedSubview($0)}
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    func setup() {
        setProfileLayer()
        setButtonLayer()
    }
    
    func setProfileLayer() {
        [profileImage, countStack, profileStack].forEach{view.addSubview($0)}
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            profileImage.trailingAnchor.constraint(equalTo: countStack.leadingAnchor, constant: -41),
            profileImage.widthAnchor.constraint(equalToConstant: 88),
            profileImage.heightAnchor.constraint(equalToConstant: 88),
            countStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            countStack.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            profileStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            profileStack.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 14),
            profileStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    func setButtonLayer() {
        [buttonStack].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            buttonStack.topAnchor.constraint(equalTo: profileStack.bottomAnchor, constant: 11),
        ])
    }
 
    
    @objc func sideBarTapped() {
        print("사이드바 버튼이 눌렸습니다.")
    }
    
    @objc func followButtonTapped() {
        print("팔로우 버튼이 눌렸습니다.")
    }
    
    deinit {
        print("ProfileDesignViewController이 화면에서 사라졌습니다.")
    }
}


//MARK: - ViewLoad 시점

extension ProfileDesignViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NabaeCamp"
        self.navigationItem.rightBarButtonItem = self.rightItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImage.layer.frame.size = CGSize(width: 88, height: 88)
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }
}

//MARK: - 스유 Preview

// SwiftUI를 활용한 미리보기
struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeVCReprsentable().edgesIgnoringSafeArea(.all)
    }
}

struct HomeVCReprsentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let ProfileDesignViewController = ProfileDesignViewController()
        return UINavigationController(rootViewController: ProfileDesignViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    typealias UIViewControllerType = UIViewController
}
