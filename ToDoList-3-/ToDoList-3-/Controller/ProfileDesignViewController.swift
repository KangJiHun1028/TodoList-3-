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
        imge.layer.borderWidth = 2
        return imge
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        settingUI()
        layoutView()
    }

    func settingUI() {
        view.backgroundColor = .systemBackground
            
        view.addSubview(mainLabel)
        view.addSubview(menuButton)
        view.addSubview(userImage)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
    }
        
    func layoutView() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            userImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 14),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
