//
//  ProfileDesignViewController.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/14.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    let customTabBar = UITabBar()
    
    lazy var rightItem: UIBarButtonItem = {
        let image = UIImage(named: "Menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(sideBarTapped))
        return button
    }()
    
    var profileImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "UserPic")//?.withTintColor(.black, renderingMode: .alwaysOriginal)
        iv.image = image
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var postNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "OpenSans", size: 16.5)
        return label
    }()
    
    var postLabel: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont(name: "OpenSans", size: 14)
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
        label.font = UIFont(name: "Open Sans", size: 16.5)
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
        button.frame.size = CGSize(width: 30, height: 30)
//        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let firstGridButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "squareshape.split.3x3")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(gridButtonTapped), for: .touchUpInside)
        return button
    }()

    let emptyLabel: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var gridStack: UIStackView = {
        let stack = UIStackView()
        [firstGridButton, emptyLabel, emptyLabel].forEach{stack.addArrangedSubview($0)}
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(ThumbnailCell.self, forCellWithReuseIdentifier: ThumbnailCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setup() {
        setProfileLayer()
        setButtonLayer()
        setGridLayer()
        setTabBar()
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
    
    func setGridLayer() {
        [gridStack, photoCollectionView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            gridStack.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 10),
            gridStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.topAnchor.constraint(equalTo: gridStack.bottomAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setTabBar() {
        view.addSubview(customTabBar)
        
        let image = UIImage(systemName: "house")
        let mainBarItem = UITabBarItem(title: "메인 화면", image: image, tag: 0)
        
        customTabBar.setItems([mainBarItem], animated: false)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBar.heightAnchor.constraint(equalToConstant: 84)
        ])
        customTabBar.delegate = self
    }
    
    func handleTapBarItemTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
 
    @objc func sideBarTapped() {
        print("사이드바 버튼이 눌렸습니다.")
    }
    
    @objc func followButtonTapped() {
        print("팔로우 버튼이 눌렸습니다.")
    }
    
    @objc func gridButtonTapped() {
        print("그리드 버튼이 눌렸습니다.")
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
        self.navigationItem.setHidesBackButton(true, animated:true)
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImage.layer.frame.size = CGSize(width: 88, height: 88)
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate {
 
}

extension ProfileDesignViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.identifier, for: indexPath) as! ThumbnailCell
/// 지금은 이미지를 돌고 있지만 cell에 들어가는 이미지는 1로 고정 -> the images are being rotated, yet the indexPath of the cells, the columns for individual cells aren't being changed. thus a single cell is being populated with the exact image.
        let imageName = "picture-\(indexPath.item + 1)"
        cell.setImage(image: imageName)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

extension ProfileDesignViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            handleTapBarItemTapped()
        }
    }
}
