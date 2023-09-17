//
//  ToDoViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/14.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var table: UITableView!
    private let cellIdentifier = "cell"
    var navigationBar = UINavigationBar()
    var contentList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onClickAddButton(_:))), animated: false)
    }

    @objc
    private func onClickAddButton(_ sender: Any?) {
        contentList.append("\(contentList.count + 1)")
        table.reloadData()
    }

    private func setupTableView() {
        table = UITableView(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.dataSource = self
        table.delegate = self // UITableViewDelegate 설정
        view.addSubview(table)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = contentList[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0 // 각 셀의 높이를 44 포인트로 설정 (원하는 값으로 변경 가능)
    }
}
