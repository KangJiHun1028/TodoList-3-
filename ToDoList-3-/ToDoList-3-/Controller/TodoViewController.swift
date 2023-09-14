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
    private var todoList = [TodoItem]() // 배열에 TodoItem을 저장하는 변수

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addNewTodo() // 예시로 새로운 TodoItem을 추가하는 메서드 호출
    }

    private func setupTableView() {
        table = UITableView(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.dataSource = self
        table.delegate = self // UITableViewDelegate 설정
        view.addSubview(table)
    }

    private func addNewTodo() {
        let newTodo = TodoItem(title: "New Task") // 새로운 TodoItem 생성
        todoList.append(newTodo) // todoList 배열에 추가

        table.reloadData() // 테이블 뷰 리로드
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = todoList[indexPath.row].title

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0 // 각 셀의 높이를 44 포인트로 설정 (원하는 값으로 변경 가능)
    }
}
