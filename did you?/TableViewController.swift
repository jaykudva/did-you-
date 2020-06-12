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
    
    var needTasks: [NeedTask] {
        return CoreDataController.shared.needTasks.reversed()
    }
    
    var gotTasks: [GotTask] {
        return CoreDataController.shared.gotTasks.reversed()
    }
    
    var wantTasks: [WantTask] {
        return CoreDataController.shared.wantTasks.reversed()
    }
    
    // reversed list to have newest tasks at the top
    var oppTasks: [Task] {
        return tasks.reversed()
    }
    
    var sortedTasks = [Task]()
    var namesOfSections = [priorityLevel]()
    
    var need = priorityLevel()
    var got = priorityLevel()
    var want = priorityLevel()
    
    
    func loadUp() {
        need.levelNum = 3
        need.levelString = "need"
        got.levelNum = 2
        got.levelString = "got"
        want.levelNum = 1
        want.levelString = "want"
        namesOfSections.append(need)
        namesOfSections.append(got)
        namesOfSections.append(want)
    }
    
    func sortList() {
        sortedTasks = oppTasks.sorted(by: {$0.priority > $1.priority})
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
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        sortList()
        loadUp()
    }
    
    // reload data everytime table is brought to foreground
    override func viewDidAppear(_ animated: Bool) {
        sortList()
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return namesOfSections.count
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return namesOfSections[section].levelString
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerCell
        cell.setup(array: namesOfSections, section: section)
        return cell.contentView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49
    }
    
    
}

// MARK: - UITableViewController
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return needTasks.count
        } else if section == 1 {
            return gotTasks.count
        }
        
        return wantTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TableViewCell
        
        if indexPath.section == 0 {
            cell.setup(task: needTasks[indexPath.row])
        } else if indexPath.section == 1 {
            cell.setup(task: gotTasks[indexPath.row])
        } else if indexPath.section == 2 {
            cell.setup(task: wantTasks[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section is: \(indexPath.section)")
//        print("row is: \(indexPath.row) ")
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        if indexPath.section == 0 {
            vc?.setup(theTask: needTasks[indexPath.row])
        } else if indexPath.section == 1 {
            vc?.setup(theTask: gotTasks[indexPath.row])
        } else if indexPath.section == 2 {
            vc?.setup(theTask: wantTasks[indexPath.row])
        }
        self.navigationController?.pushViewController(vc!, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
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
        
        let num = indexPath.section
        
        if num == 0 {
            CoreDataController.shared.removeTask(with: needTasks[indexPath.row].task!, priority: needTasks[indexPath.row].priority, and: needTasks[indexPath.row].date!)
        } else if num == 1 {
            CoreDataController.shared.removeTask(with: gotTasks[indexPath.row].task!, priority: gotTasks[indexPath.row].priority, and: gotTasks[indexPath.row].date!)
        } else if num == 2 {
            CoreDataController.shared.removeTask(with: wantTasks[indexPath.row].task!, priority: wantTasks[indexPath.row].priority, and: wantTasks[indexPath.row].date!)
        }
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
