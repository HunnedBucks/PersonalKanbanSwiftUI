//
//  PersistenceManager.swift
//  NakedKanban
//
//  Created by Hunter Buxton on 4/22/19.
//  Copyright © 2019 GreyHydeTech. All rights reserved.
//


import Foundation
import CoreData

class PersistenceManager {
    
    private init() {}
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PersonalKanban")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchTasks() -> [TaskMO] {
        let entityName = String(describing: TaskMO.self)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        print("about to attempt a fetch all objects of type \(entityName)")
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [TaskMO]
            return fetchedObjects ?? [TaskMO]()
        } catch {
            print(error)
            return [TaskMO]()
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        print("about to attempt a fetch all objects of type \(entityName)")
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
//    func fetchTasksWhere(status: String) -> [Task] {
//        let tasks = self.fetch(Task.self)
//        var tempList = [Task]()
//        for task in tasks {
//            if status == task.status! {
//                tempList.append(task)
//            }
//        }
//        return tempList
//    }
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
//    func deleteAllData() {
//        self.deleteAllInstancesOfType(Task.self)
//        self.deleteAllInstancesOfType(Epic.self)
//    }
    
    func deleteAllInstancesOfType<T: NSManagedObject>(_ objectType: T.Type) {
        let fetchedObjects = fetch(T.self)
        print("the fetchRequest returned \(fetchedObjects.count) objects of type \(String(describing: T.self))")
        for object in fetchedObjects {
            self.delete(object)
        }
    }
    
    func deleteInstancesOfType<T: NSManagedObject>(_ objectType: T.Type, where kvDic: [String:String]) { //where key: String, value: String) {
        let fetchedObjects = fetch(T.self)
        print("the fetchRequest returned \(fetchedObjects.count) objects of type \(String(describing: T.self))")
        for object in fetchedObjects {
            var allMatch = true
            for (key,value) in kvDic {
                guard matchKVPair(object: object, key: key, value: value) else {
                    allMatch = false
                    break
                }
            }
            if allMatch {
                print("deleting object")
                self.delete(object)
            }
        }
    }
    
    func matchKVPair<T: NSManagedObject>(object: T, key: String, value: String) -> Bool {
        let value1 = object.value(forKey: key) as! String
        return value1 == value
    }
}





//    func compareKeyValuePair<T: NSManagedObject, Y>(entity: T, key: String, value: Y) -> Bool {
//        // this?
//        let value1 = entity.value(forKey: key)
//        let type1 = type(of: value1)
//        guard type1 == Y.self else {
//            return false
//        }
//
//        // or this?
//        let value2 = value1 is Y
//
//        return (value1 == value)
//
//        if let temp = value1 {
//            if let temp1 = temp as? Y {
//                return temp1 == value
//            }
//        }
//
//
//
//
//    }





//    func deleteInstancesOfType<T: NSManagedObject>(_ objectType: T.Type, where propertyKeyVakueDic: [String : String] ) {
//        let fetchedObjects = fetch(T.self)
//        print("the fetchRequest returned \(fetchedObjects.count) objects of type \(String(describing: T.self))")
//        for object in fetchedObjects {
//            var matchAll = true
//            for (key0,val0) in propertyKeyVakueDic {
//                guard let val1 = object.value(forKey: key0) as? String else {
//                    matchAll = false
//                    break
//                }
//                guard val1 == val0 else {
//                    matchAll = false
//                    break
//                }
//
//            }
//            if matchAll {
//                self.delete(object)
//            }
//        }
//    }
