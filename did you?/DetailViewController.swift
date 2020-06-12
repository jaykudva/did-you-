//
//  DetailViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/3/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        taskHere.text = textInput
        priorityHere.text = priorityInput
        dateHere.text = dateInput

        // Do any additional setup after loading the view.
    }
    
    
    func setup(theTask: WantTask) {
        textInput = theTask.task!
        dateInput = theTask.date!.toString(dateFormat: "MMMM d, h:mm a")
        priorityInput = "Want"
    }
    
    public var textInput = String()
    public var priorityInput = String()
    public var dateInput = String()
    
    @IBOutlet weak var taskHere: UILabel!
    @IBOutlet weak var priorityHere: UILabel!
    @IBOutlet weak var dateHere: UILabel!
    
}
