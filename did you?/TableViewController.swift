//
//  TableViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/3/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // list of tasks that gets updated when tasks are updated and removed
    var tasks: [Task] {
        return CoreDataController.shared.tasks
    }
    
    // reversed list to have newest tasks at the top
    var oppTasks: [Task] {
        return tasks.reversed()
    }
    
    //this is all useless bc .reversed() is a thing
    var tasksButReversed = [Task]()
    func tasksReversed() -> [Task] {
        var i = tasks.count - 1
        while i >= 0 {
            tasksButReversed.append(tasks[i])
            i -= 1
        }
        return tasksButReversed
    }
    
    // updated tableview with data on app launch
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    // reload data everytime table is brought to foreground
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewController
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TableViewCell
        cell.setup(task: oppTasks[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}


extension TableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        CoreDataController.shared.removeTask(with: tasks[indexPath.row].task!, priority: tasks[indexPath.row].priority, and: oppTasks[indexPath.row].date!)
        tableView.reloadData()
    }
}


extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
