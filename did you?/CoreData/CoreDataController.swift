//
//  CoreDataController.swift
//  did you?
//
//  Created by Jay Kudva on 6/2/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataController {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "didModel")
       
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load the persistent stores from model didModel")
            }
        }
        return container
    }()
    
    let needPersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "needModel")
       
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load the persistent stores from model needModel")
            }
        }
        return container
    }()
    
    let wantPersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "wantModel")
       
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load the persistent stores from model wantModel")
            }
        }
        return container
    }()
    
    let gotPersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "gotModel")
       
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load the persistent stores from model gotModel")
            }
        }
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private var needContext: NSManagedObjectContext {
        return needPersistentContainer.viewContext
    }
    private var gotContext: NSManagedObjectContext {
        return gotPersistentContainer.viewContext
    }
    private var wantContext: NSManagedObjectContext {
        return wantPersistentContainer.viewContext
    }
    
    var tasks: [Task] {
        do {
            return try viewContext.fetch(NSFetchRequest<Task>(entityName: "Task"))
        } catch let error {
            print("failed to retrieve: \(error)")
            return []
        }
    }
    
    var needTasks: [NeedTask] {
        do {
            return try needContext.fetch(NSFetchRequest<NeedTask>(entityName: "NeedTask"))
        } catch let error {
            print("failed to retrieve: \(error)")
            return []
        }
    }
    var gotTasks: [GotTask] {
        do {
            return try gotContext.fetch(NSFetchRequest<GotTask>(entityName: "GotTask"))
        } catch let error {
            print("failed to retrieve: \(error)")
            return []
        }
    }
    var wantTasks: [WantTask] {
        do {
            return try wantContext.fetch(NSFetchRequest<WantTask>(entityName: "WantTask"))
        } catch let error {
            print("failed to retrieve: \(error)")
            return []
        }
    }
    
    
    func addTask(with msg: String, priority: Int16, and date: Date) {
        
        if priority == 3 {
            let specificTask = NSEntityDescription.insertNewObject(forEntityName: "NeedTask", into: needContext) as? NeedTask
            specificTask?.setValue(msg, forKey: "task")
            specificTask?.setValue(priority, forKey: "priority")
            specificTask?.setValue(date, forKey: "date")
        } else if priority == 2 {
            let specificTask = NSEntityDescription.insertNewObject(forEntityName: "GotTask", into: gotContext) as? GotTask
            specificTask?.setValue(msg, forKey: "task")
            specificTask?.setValue(priority, forKey: "priority")
            specificTask?.setValue(date, forKey: "date")
        } else if priority == 1 {
            let specificTask = NSEntityDescription.insertNewObject(forEntityName: "WantTask", into: wantContext) as? WantTask
            specificTask?.setValue(msg, forKey: "task")
            specificTask?.setValue(priority, forKey: "priority")
            specificTask?.setValue(date, forKey: "date")
        }
        
        save()
    }
    
    func addNotes(with want: WantTask, and notes: String) {
        want.notes = notes
        save()
    }
    func addNotes(with got: GotTask, and notes: String) {
        got.notes = notes
        save()
    }
    func addNotes(with need: NeedTask, and notes: String) {
        need.notes = notes
        save()
    }
    
    func removeTask(with task: String, priority: Int16, and date: Date) {
        
        if priority == 3 {
            let fetchRequest: NSFetchRequest<NeedTask> = NeedTask.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "%K == %@ AND %K == %@ AND %K == %@",
            argumentArray: ["task", task,
                            "priority", priority,
                            "date", date])
            
            do {
                guard let task = try needContext.fetch(fetchRequest).first else { return }
                
                needContext.delete(task)
                save()
            } catch let error {
                print("Unable to delete task with message \(task), priority: \(priority), and date: \(date). Error: \(error)")
            }
            
        } else if priority == 2 {
            let fetchRequest: NSFetchRequest<GotTask> = GotTask.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "%K == %@ AND %K == %@ AND %K == %@",
            argumentArray: ["task", task,
                            "priority", priority,
                            "date", date])
            
            do {
                guard let task = try gotContext.fetch(fetchRequest).first else { return }
                
                gotContext.delete(task)
                save()
            } catch let error {
                print("Unable to delete task with message \(task), priority: \(priority), and date: \(date). Error: \(error)")
            }
            
            
        } else if priority == 1 {
            let fetchRequest: NSFetchRequest<WantTask> = WantTask.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "%K == %@ AND %K == %@ AND %K == %@",
            argumentArray: ["task", task,
                            "priority", priority,
                            "date", date])
            
            do {
                guard let task = try wantContext.fetch(fetchRequest).first else { return }
                
                wantContext.delete(task)
                save()
            } catch let error {
                print("Unable to delete task with message \(task), priority: \(priority), and date: \(date). Error: \(error)")
            }
        }
    }
    
    
    private func save() {
        do {
            try viewContext.save()
            try needContext.save()
            try gotContext.save()
            try wantContext.save()
        } catch let error{
            print("Unable to save. Error: \(error)")
        }
    }
}
