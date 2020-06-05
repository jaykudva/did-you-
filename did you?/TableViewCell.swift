//
//  TableViewCell.swift
//  did you?
//
//  Created by Jay Kudva on 6/3/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var taskMain: UILabel!
    
    @IBOutlet weak var taskSub: UILabel!
    
    @IBOutlet weak var priorityView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 8
    }
    func setup(task: Task) {
        let priorityLvl = task.priority
        var priorityMsg = ""
        taskMain.text = task.task
        
        if priorityLvl == 3 {
               priorityMsg = "Need"
           } else if priorityLvl == 2 {
               priorityMsg = "Will"
           } else {
               priorityMsg = "Want"
           }
        priorityView.text = "Priority: \(priorityMsg)"
        taskSub.text = task.date?.toString(dateFormat: "MMM dd, yyyy HH:mm:ss")
    }

}
