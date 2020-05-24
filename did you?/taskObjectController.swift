//
//  taskObjectController.swift
//  did you?
//
//  Created by Jay Kudva on 5/24/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class taskObject: NSObject {
    // Priority of task on a scale of 1 - 3
    var priority = 0
    // Task string
    var task = ""
    // Time at which task was done
    let currDate = Date()
    
    func getPriority() -> Int {
        return self.priority
    }
    
    func getTask() -> String {
        return self.task
    }
    
    func getDate() -> Date {
        return self.currDate
    }
    
}
