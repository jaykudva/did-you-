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
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private var entityName: String {
        return "Task"
    }
    
    var tasks: [Task] {
        do {
            return try viewContext.fetch(NSFetchRequest<Task>(entityName: "Task"))
        } catch let error {
            print("failed to retrieve: \(error)")
            return []
        }
    }
    
    func addTask(with msg: String, priority: Int16, and date: Date) {
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: viewContext) as? Task
        
        
        task?.setValue(msg, forKey: "task")
        task?.setValue(priority, forKey: "priority")
        task?.setValue(date, forKey: "date")
        
        save()
    }
    
    func removeTask(with task: String, priority: Int16, and date: Date) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %@ AND %K == %@ AND %K == %@",
                                             argumentArray: ["task", task,
                                                             "priority", priority,
                                                             "date", date])
        do {
            guard let task = try viewContext.fetch(fetchRequest).first else { return }
            
            viewContext.delete(task)
            save()
        } catch let error {
            print("Unable to delete task with message \(task), priority: \(priority), and date: \(date). Error: \(error)")
        }
    }
    
    private func save() {
        do {
            try viewContext.save()
        } catch let error{
            print("Unable to save. Error: \(error)")
        }
    }
}
