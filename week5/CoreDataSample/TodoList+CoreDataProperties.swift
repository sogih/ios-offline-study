//
//  TodoList+CoreDataProperties.swift
//  
//
//  Created by ROGERJIN on 17/06/2019.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var todo: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var designatedDate: NSDate?
    @NSManaged public var dateType: Int16

}
