//
//  TableViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/3/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [Task] {
        return CoreDataController.shared.tasks
    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        
        // CoreDataController.shared.addTask(with: "only", priority: 2, and: Date())
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewController
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TableViewCell
        
        cell.setup(task: oppTasks[indexPath.row])
        
//        cell!.textLabel?.text = tasks[indexPath.row].task
//        cell!.detailTextLabel?.text = tasks[indexPath.row].date?.toString(dateFormat: "yyyy/MMM/dd HH:mm:ss")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    private fun deleteTask(at indexPath: IndexPath) {
//        CoreDataController.shared.removeTask(with: <#T##String#>, priority: <#T##Int16#>, and: <#T##Date#>)
//    }
}


extension TableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        CoreDataController.shared.removeTask(with: tasks[indexPath.row].task!, priority: tasks[indexPath.row].priority, and: tasks[indexPath.row].date!)
        
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
