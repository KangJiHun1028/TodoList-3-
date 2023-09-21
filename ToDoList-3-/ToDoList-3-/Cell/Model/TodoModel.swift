//
//  TodoModel.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/21.
//

import CoreData
import Foundation
import UIKit
class TodoModel {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = appDelegate.persistentContainer.viewContext
    var memoList: [Contact] = []

    func saveTodoData(title: String) {
        let contact = Contact(context: context)
        contact.title = title
        do {
            try context.save()
        } catch let error as NSError {
            print("저장하지 못했습니다. \(error), \(error.userInfo)")
        }
    }

    func getTodoData() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        do {
            memoList = try context.fetch(request)
        } catch {
            print(error)
        }
    }
}
