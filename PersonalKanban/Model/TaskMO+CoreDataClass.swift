//
//  TaskMO+CoreDataClass.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TaskMO)
public class TaskMO: NSManagedObject {

    convenience init() {
        self.init(entity: TaskMO.entity(), insertInto: PersistenceManager.shared.context)
        self.id = UUID()
        self.name = ""
        self.info = ""
    }
    convenience init?(_ name: String, info: String) {
        self.init(entity: TaskMO.entity(), insertInto: PersistenceManager.shared.context)
        self.id = UUID()
        self.name = name
        self.info = info
    }
}
