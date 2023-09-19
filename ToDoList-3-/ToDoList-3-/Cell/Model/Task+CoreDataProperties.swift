//
//  Task+CoreDataProperties.swift
//  ToDoList-3-
//
//  Created by t2023-m0053 on 2023/09/18.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var modifyDate: Date?
    @NSManaged public var isCompleted: Bool

}

extension Task : Identifiable {

}
