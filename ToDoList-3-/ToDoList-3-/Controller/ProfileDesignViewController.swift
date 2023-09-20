//
//  ProfileDesignViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/18.
//

// MARK: - Imports

import UIKit
import CoreData

// MARK: - ProfileDesignViewController Class

class ProfileDesignViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties

    var isFollowing: Bool = false
    lazy var collectionViewData: [UIImage] = [#imageLiteral(resourceName: "Image"), #imageLiteral(resourceName: "Image 3"), #imageLiteral(resourceName: "Image 2"), #imageLiteral(resourceName: "Image 4"), #imageLiteral(resourceName: "Image 5"), #imageLiteral(resourceName: "lmage 6"), #imageLiteral(resourceName: "Image 7"), #imageLiteral(resourceName: "Image 7"), #imageLiteral(resourceName: "Image 7"), #imageLiteral(resourceName: "Image 7"), #imageLiteral(resourceName: "Image 7")]

    // MARK: - UI Elements

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center

        return label
    }()

    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)

        return button
    }()

    lazy var userImage: UIImageView = {
        let imge = UIImageView()
        imge.image = #imageLiteral(resourceName: "Ellipse 1")
        imge.contentMode = .scaleToFill
        imge.clipsToBounds = true
        imge.layer.cornerRadius = 50
        imge.layer.borderWidth = 1
        return imge
    }()

    lazy var postNumber: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    lazy var followerNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    lazy var followingNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    lazy var post: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()

    lazy var follower: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()

    lazy var following: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()

    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "강지훈"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var userAffiliation: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer🍎"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()

    lazy var userAddress: UILabel = {
        let label = UILabel()
        label.text = "https://minsakr10.tistory.com/"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.blue
        return label
    }()

    lazy var followButton: UIButton = {
        let button = UIButton(type: .system)

        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        let desiredWidth: CGFloat = 160
        let desiredHeight: CGFloat = 30
        button.widthAnchor.constraint(equalToConstant: desiredWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: desiredHeight).isActive = true
        return button
    }()

    lazy var messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Message", for: .normal)
        button.tintColor = .black
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        let desiredHeight: CGFloat = 30
        button.heightAnchor.constraint(equalToConstant: desiredHeight).isActive = true
        return button
    }()

    lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        let desiredWidth: CGFloat = 30
        let desiredHeight: CGFloat = 30
        button.widthAnchor.constraint(equalToConstant: desiredWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: desiredHeight).isActive = true
        return button
    }()

    lazy var dividerButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "squareshape.split.3x3"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.5)
        return button
    }()

    lazy var personButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.5)
        return button
    }()

    lazy var buttomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(bottomButton)
        return view
    }()

    lazy var bottomButton: UIButton = {
        var button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.75)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        settingUI()
        layoutView()
    }

    // MARK: - UIStackView

    lazy var postStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postNumber, post])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()

    lazy var followerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followerNumber, follower])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()

    lazy var followingStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followingNumber, following])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()

    lazy var profileStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()

    lazy var userInformationStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userName, userAffiliation, userAddress])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 2
        return stack
    }()

    lazy var partButtonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()

    lazy var dividerButtonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dividerButton, personButton])
        stack.axis = .horizontal // 수평 스택 뷰로 설정
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()

    // MARK: - UICollectionView

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        return collView
    }()

    // MARK: - UI Setup Functions

    func settingUI() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        view.backgroundColor = .systemBackground
        view.addSubview(mainLabel)
        view.addSubview(menuButton)
        view.addSubview(userImage)
        view.addSubview(profileStackView)
        view.addSubview(userInformationStackView)
        view.addSubview(partButtonStackView)
        view.addSubview(dividerButtonStackView)
        view.addSubview(collectionView)
        view.addSubview(buttomView)
        view.addSubview(bottomButton)

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        userInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        partButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        dividerButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        buttomView.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.translatesAutoresizingMaskIntoConstraints = false

        isFollowing = true

        updateFollowButtonText()
    }

    @objc func followButtonTapped() {
        isFollowing.toggle()
        updateFollowButtonText()
    }

    func updateFollowButtonText() {
        let title = isFollowing ? "Follow" : "UnFollow"
        let color = isFollowing ? UIColor.black : UIColor.black
        let backgroundColor = isFollowing ? UIColor.systemBlue : UIColor.white
        followButton.setTitle(title, for: .normal)
        followButton.setTitleColor(color, for: .normal)
        followButton.backgroundColor = backgroundColor
    }

    func layoutView() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            userImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 14),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),

            profileStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 45),
            profileStackView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 15),
            profileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),

            userInformationStackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            userInformationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            partButtonStackView.topAnchor.constraint(equalTo: userInformationStackView.bottomAnchor, constant: 10),
            partButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            partButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            dividerButtonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            dividerButtonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            dividerButtonStackView.heightAnchor.constraint(equalToConstant: 40),
            dividerButtonStackView.topAnchor.constraint(equalTo: partButtonStackView.bottomAnchor, constant: 10),

            collectionView.topAnchor.constraint(equalTo: dividerButtonStackView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            bottomButton.topAnchor.constraint(equalTo: buttomView.topAnchor, constant: 10),
            bottomButton.centerXAnchor.constraint(equalTo: buttomView.centerXAnchor),

            buttomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttomView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}

// MARK: - Extensions

extension ProfileDesignViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell

        // 이미지를 컬렉션 뷰 셀에 설정
        let imageView = UIImageView(image: collectionViewData[indexPath.item])
        cell.imageView.image = collectionViewData[indexPath.item]

        return cell
    }
}

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 4) / 3
        let size = CGSize(width: width, height: width)
        return size
    }
}
