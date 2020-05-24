//
//  taskController.swift
//  did you?
//
//  Created by Jay Kudva on 5/24/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class taskController: NSObject {
    
    static var toDosArray:[taskObject] = []
    
    class func addToDo(_ task : taskObject) {
        taskController.toDosArray.append(task)
    }
    
    class func getToDos() -> [taskObject] {
        return taskController.toDosArray
    }
}
