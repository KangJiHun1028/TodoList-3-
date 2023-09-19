//
//  task.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/18.
//

import CoreData

class Model: NSManagedObject {
    @NSManaged var content: String
    @NSManaged var isCompleted: Bool
}
