//
//  TodoDoneViewController.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/18.
//

import UIKit
import CoreData

class TodoDoneViewController: UIViewController {
    var taskDetail: String?
    // Add contentList if you want to use it in TodoDoneViewController
    var contentList: [String: [String: Bool]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Use taskDetail to update your UI
        print(taskDetail ?? "No data")
    }

    // In your TodoViewController
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionName = Array(contentList.keys)[indexPath.section]
        
        if var items = contentList[sectionName] {
            let itemName = Array(items.keys)[indexPath.row]
            
            if items[itemName] == true { // Check if the item is checked
                items[itemName] = !(items[itemName] ?? false)
                contentList[sectionName] = items
                
                // Create an instance of DetailViewController and pass the selected data.
                let detailVC = TodoDoneViewController()
                detailVC.taskDetail = itemName
                
                // Push DetailViewController onto navigation stack.
                navigationController?.pushViewController(detailVC, animated: true)
                
            } else {
                items[itemName] = !(items[itemName] ?? false)
                contentList[sectionName] = items
            }
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
