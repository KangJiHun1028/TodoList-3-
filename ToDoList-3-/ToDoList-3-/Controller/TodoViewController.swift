
//
//  ToDoViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/14.
//

import CoreData
import UIKit

// 할 일 항목들을 보여주고 관리하는 뷰 컨트롤러입니다.
class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var selectedTask: Contact? // 선택된 할 일 항목을 저장하는 변수입니다.
    var tasks: [Contact] = [] // 모든 할 일 항목들을 저장하는 배열입니다.
    private var table: UITableView! // 테이블 뷰를 선언합니다.
    private let cellIdentifier = "cell"
    var navigationBar = UINavigationBar()
    
    /* 각 섹션(할 일 카테고리)의 이름과 해당 섹션의 모든 할 일 항목들(그리고 그 체크 상태)를 저장하는 딕셔너리입니다.
     딕셔너리의 키는 섹션 이름이며 값은 다른 딕셔너리인데, 이 중첩된 딕셔너리의 키는 할 일 항목의 이름이고 값은 그 체크 상태입니다.*/
    var contentList: [String: [String: Bool]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView() // 테이블 뷰를 설정합니다.
        
        /* 네비게이션 바에 'Add' 버튼을 추가합니다. 이 버튼은 사용자가 탭하면 onClickAddButton(_:) 메서드가 호출됩니다.*/
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onClickAddButton(_:))), animated: false)
        
        fetchTasks() // CoreData에서 모든 할 일 항목들을 가져옵니다.
    }
    
    /* CoreData에서 모든 할 일 항목들을 가져오는 메서드입니다.
     가져온 데이터를 바탕으로 contentList를 업데이트하고 테이블 뷰를 리로드합니다.*/
    func fetchTasks() {
        let todoModel = TodoModel()
        todoModel.getTodoData()
         
        tasks = todoModel.memoList
        updateContentList()
         
        table.reloadData()
    }
     
    /* 'Add' 버튼 클릭 시 호출되는 메서드로 새로운 할일 및 세션 추가 기능 제공 */
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
                  
                /* CoreData에 새로운 할 일 항목을 저장하고 테이블 뷰를 리로드합니다.
                 이렇게 하면 사용자가 방금 추가한 할 일 항목이 즉시 테이블 뷰에 나타납니다.*/
                let todoModel = TodoModel()
                todoModel.saveTodoData(title: itemName)
                  
                self.table.reloadData()
            }
        }
          
        alertController.addAction(saveAction)
          
        /* 알림창을 화면에 보여줍니다.
         이 알림창은 사용자가 새로운 할 일 항목을 입력할 수 있는 텍스트 필드 두 개와 '저장' 버튼을 포함하고 있습니다.*/
        present(alertController, animated: true, completion: nil)
    }
      
    /* CoreData에서 가져온 데이터를 바탕으로 contentList를 업데이트하는 메서드입니다.*/
    private func updateContentList() {
        contentList.removeAll()
           
        for task in tasks {
            if let title = task.title {
                if contentList[title] == nil {
                    contentList[title] = [title: false]
                }
            }
        }
    }

    // 테이블 뷰 설정 메서드입니다.
    private func setupTableView() {
        table = UITableView(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self // UITableViewDelegate 설정합니다.
        view.addSubview(table)
    }

    /* UITableViewDataSource 프로토콜 메서드:
     섹션의 수를 반환합니다. 여기서는 각 섹션 이름의 수와 같습니다.*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentList.keys.count
    }

//    각 섹션의 제목을 반환합니다. 여기서는 각 섹션 이름과 같습니다
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(contentList.keys)[section]
    }

//    각 섹션의 셀 수(행 수) 를 반환합니다.여기서는 각 섹션의 할 일 항목 수와 같습니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(contentList.keys)[section]
        return contentList[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let key = Array(contentList.keys)[indexPath.section] // 현재 세션의 이름
        // 해당 섹션에 속하는 할 일 항목들
        if var value = contentList[key] {
            let itemKey = Array(value.keys)[indexPath.row] // 현재 셀의 할 일 항목 이름
            cell.textLabel?.text = itemKey
            
            /* 할 일 항목이 체크되었는지 여부에 따라 셀의 액세서리 타입을 설정하고,
             isCompleted 값을 업데이트합니다.*/
            if value[itemKey] == true {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                value[itemKey] = true // isCompleted 값을 true로 설정
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                value[itemKey] = false // isCompleted 값을 false로 설정
            }
            
            contentList[key] = value // 변경된 value를 다시 할당
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0 // 각 셀의 높이를 44 포인트로 설정 (원하는 값으로 변경 가능)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionName = Array(contentList.keys)[indexPath.section]
        
        if var items = contentList[sectionName], let itemName = Array(items.keys)[indexPath.row] as? String {
            items[itemName] = !(items[itemName] ?? false)
            contentList[sectionName] = items
            /* CoreData의 해당 할 일 항목의 체크 상태를 업데이트하고 테이블 뷰를 리로드합니다.
             이렇게 하면 사용자가 셀을 탭하여 체크 상태를 변경할 때마다 화면과 CoreData가 동기화됩니다.*/
            let todoModel = TodoModel()
            todoModel.updateIsCheckedStatus(forItemWithName: itemName, to: items[itemName]!)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
