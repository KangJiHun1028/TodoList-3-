//
//  Task+CoreDataProperties.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/20.
//
//

import CoreData
import Foundation
import UIKit
class Task: NSManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged var sectionName: String?
    @NSManaged var itemName: String?
}

extension Task: Identifiable {}
