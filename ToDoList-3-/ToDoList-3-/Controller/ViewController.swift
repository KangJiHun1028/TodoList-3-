//
//  ViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/14.
//

import UIKit

class ViewController: UIViewController {
    // 상단 라벨
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "ToDo List"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 할일 정하기 버튼
    private lazy var todoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("할일 정하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 17)
        button.addTarget(self, action: #selector(todoGoButtonTapped), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 라벨
        view.addSubview(mainLabel)
        view.addSubview(todoButton)

        // 레이아웃 설정
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            todoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 200),
        ])
    }

    @objc private func todoGoButtonTapped() {
        let todoViewController = TodoViewController()
        navigationController?.pushViewController(todoViewController, animated: true)
    }
}
