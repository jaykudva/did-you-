//
//  DetailViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/3/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        taskHere.text = textInput
        priorityHere.text = priorityInput
        dateHere.text = dateInput
        notesField.text = notesInput
    }
    
    
    func setup(theTask: WantTask) {
        textInput = theTask.task!
        dateInput = theTask.date!.toString(dateFormat: "MMMM d, h:mm a")
        notesInput = theTask.notes ?? ""
        priorityInput = "Want"
        WANT = theTask
        num = 3
    }
    
    func setup(theTask: NeedTask) {
        textInput = theTask.task!
        dateInput = theTask.date!.toString(dateFormat: "MMMM d, h:mm a")
        notesInput = theTask.notes ?? ""
        priorityInput = "Need"
        NEED = theTask
        num = 1
    }
    
    func setup(theTask: GotTask) {
        textInput = theTask.task!
        dateInput = theTask.date!.toString(dateFormat: "MMMM d, h:mm a")
        notesInput = theTask.notes ?? ""
        priorityInput = "Got"
        GOT = theTask
        num = 2
    }

    
    @IBAction func enterAdd(_ sender: Any) {
        addTheThing()
    }
    
    
    func addTheThing() {
        notesInput = notesField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if num == 3 {
            CoreDataController.shared.addNotes(with: WANT!, and: notesInput)
        } else if num == 2 {
            CoreDataController.shared.addNotes(with: GOT!, and: notesInput)
        } else if num == 1 {
            CoreDataController.shared.addNotes(with: NEED!, and: notesInput)
        }
        self.view.endEditing(true)
    }
    
    var WANT: WantTask?
    var GOT: GotTask?
    var NEED: NeedTask?
    
    public var textInput = String()
    public var priorityInput = String()
    public var dateInput = String()
    var notesInput = ""
    
    var num = 0
 
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var taskHere: UILabel!
    @IBOutlet weak var priorityHere: UILabel!
    @IBOutlet weak var dateHere: UILabel!
    
    
}
