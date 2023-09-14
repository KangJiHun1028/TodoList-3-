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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 라벨
        view.addSubview(mainLabel)
        // 버튼
        let button = UIButton(type: .system)
        button.setTitle("할 일 정하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        // 레이아웃 설정
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 200)
        ])
    }
}
