//
//  ProfileDesignViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/18.
//

import UIKit
class ProfileDesignViewController: UIViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()
            
        settingUI()
        layoutView()
    }

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

    func settingUI() {
        view.backgroundColor = .systemBackground
            
        view.addSubview(mainLabel)
        view.addSubview(menuButton)
        view.addSubview(userImage)
        view.addSubview(profileStackView)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    func layoutView() {
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
        ])
    }
}
