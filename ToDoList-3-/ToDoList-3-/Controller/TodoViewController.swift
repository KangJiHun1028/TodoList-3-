
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
    var contentList: [String: [String: Bool]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onClickAddButton(_:))), animated: false)
    }
    
    @objc
    private func onClickAddButton(_ sender: Any?) {
        let alertController = UIAlertController(title: "할 일 정하기", message: "할 일 및 세션을 추가하세요", preferredStyle: .alert)
        
        alertController.addTextField { (textField: UITextField!) in
            textField.placeholder = "세션 이름"
        }
        
        alertController.addTextField { (textField: UITextField!) in
            textField.placeholder = "할일 추가"
        }
        
        let saveAction = UIAlertAction(title: "저장", style: .default) { _ in
            if let sectionNameField = alertController.textFields?[0],
               let itemNameField = alertController.textFields?[1],
               let sectionName = sectionNameField.text,
               !sectionName.isEmpty,
               let itemName = itemNameField.text,
               !itemName.isEmpty
            {
                if self.contentList[sectionName] != nil {
                    self.contentList[sectionName]?[itemName] = false
                } else {
                    self.contentList[sectionName] = [itemName: false]
                }
                self.table.reloadData()
            }
        }
        
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }

    private func setupTableView() {
        table = UITableView(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self // UITableViewDelegate 설정
        view.addSubview(table)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentList.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(contentList.keys)[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(contentList.keys)[section]
        return contentList[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let key = Array(contentList.keys)[indexPath.section]
        
        if let value = contentList[key] {
            let itemKey = Array(value.keys)[indexPath.row]
            cell.textLabel?.text = itemKey
            if value[itemKey] == true {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0 // 각 셀의 높이를 44 포인트로 설정 (원하는 값으로 변경 가능)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionName = Array(contentList.keys)[indexPath.section]
        
        if var items = contentList[sectionName] {
            let itemName = Array(items.keys)[indexPath.row]
            items[itemName] = !(items[itemName] ?? false)
            contentList[sectionName] = items
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
