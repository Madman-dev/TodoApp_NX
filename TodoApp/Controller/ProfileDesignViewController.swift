//
//  ProfileDesignViewController.swift
//  TodoApp
//
//  Created by Jack Lee on 2023/09/14.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    
    //MARK: - 전역 변수 선언
    let customTabBar = UITabBar()
    var isFollowButtonTapped = false
    var isMessageButtonTapped = false
    let imageAsset: [String] = (1...7).map({"picture-\($0)"})
    
    //MARK: - UIComponent 선언
    lazy var rightItem: UIBarButtonItem = {
        let image = UIImage(named: "Menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(sideBarTapped))
        return button
    }()
    
    var profileImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "UserPic")
        iv.image = image
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.white.cgColor
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var postNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        return label
    }()
    
    var postLabel: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont(name: "OpenSans-Light", size: 14)
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
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        return label
    }()
    
    var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont(name: "OpenSans-Light", size: 14)
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
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        return label
    }()
    
    var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont(name: "OpenSans-Light", size: 14)
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
        label.font = UIFont(name: "OpenSans-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileDescription: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer 🐥"
        label.font = UIFont(name: "OpenSans-Light", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileUrl: UILabel = {
        let label = UILabel()
        label.text = "나의 깃헙 링크"
        label.textColor = UIColor(hexCode: "#3898F3")
        label.font = UIFont(name: "OpenSans-Light", size: 14)
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
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var dropDownButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.down")
        button.setImage(image, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .white
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 5
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
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(ThumbnailCell.self, forCellWithReuseIdentifier: ThumbnailCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - 메서드 선언
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
        
        let image = UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let mainBarItem = UITabBarItem(title: nil, image: image, tag: 0)
        
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
        self.dismiss(animated: true)
    }
    
    func profileTapGesture() {
        let profileUrlTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        
        profileUrl.isUserInteractionEnabled = true
        profileUrl.addGestureRecognizer(profileUrlTapGesture)
    }
 
    @objc func sideBarTapped() {
        print("사이드바 버튼이 눌렸습니다.")
    }
    
    @objc func followButtonTapped() {
        
        if isFollowButtonTapped {
            followButton.backgroundColor = UIColor.white
            followButton.setTitleColor(.black, for: .normal)
            isFollowButtonTapped = false
            print("팔로우 버튼이 해제 됐습니다.")
        } else {
            followButton.backgroundColor = UIColor(hexCode: "#3898F3")
            followButton.setTitleColor(.white, for: .normal)
            isFollowButtonTapped = true
            print("팔로우 버튼이 눌렸습니다.")
        }
    }
    
    @objc func messageButtonTapped() {
        if isMessageButtonTapped {
            messageButton.backgroundColor = UIColor.white
            messageButton.setTitleColor(.black, for: .normal)
            isMessageButtonTapped = false
            print("메시지 버튼이 해제 됐습니다.")
        } else {
            messageButton.backgroundColor = UIColor(hexCode: "#3898F3")
            messageButton.setTitleColor(.white, for: .normal)
            isMessageButtonTapped = true
            print("메시지 버튼이 눌렸습니다.")
        }
    }
    
    @objc func gridButtonTapped() {
        print("그리드 버튼이 눌렸습니다.")
    }
    
    @objc func labelTapped(_ sender: UILabel) {
        print("라벨이 눌렸습니다.")
        if let url = URL(string: "https://github.com/Madman-dev") {
            UIApplication.shared.open(url)
        }
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
        profileTapGesture()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImage.layer.frame.size = CGSize(width: 88, height: 88)
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }
}

    //MARK: - UICollectionViewDelegate
extension ProfileDesignViewController: UICollectionViewDelegate {
}

    //MARK: - UICollectionViewDataSource
extension ProfileDesignViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageAsset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.identifier, for: indexPath) as! ThumbnailCell
/// 지금은 이미지를 돌고 있지만 cell에 들어가는 이미지는 1로 고정 -> the images are being rotated, yet the indexPath of the cells, the columns for individual cells aren't being changed. thus a single cell is being populated with the exact image.
        let imageName = imageAsset[indexPath.item]
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

    //MARK: - UITabBarDelegate
extension ProfileDesignViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            handleTapBarItemTapped()
        }
    }
}
