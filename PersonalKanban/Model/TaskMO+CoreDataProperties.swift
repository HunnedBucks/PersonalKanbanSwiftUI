//
//  TaskMO+CoreDataProperties.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftUI


extension TaskMO: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskMO> {
        return NSFetchRequest<TaskMO>(entityName: "TaskMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var info: String

}
