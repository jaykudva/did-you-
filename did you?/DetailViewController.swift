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
        self.notesField.delegate = self
        taskHere.text = textInput
        priorityHere.text = priorityInput
        dateHere.text = dateInput
        notesField.text = notesInput
        // Do any additional setup after loading the view.
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
        priorityInput = "Need"
        num = 1
    }
    
    func setup(theTask: GotTask) {
        textInput = theTask.task!
        dateInput = theTask.date!.toString(dateFormat: "MMMM d, h:mm a")
        priorityInput = "Got"
        num = 2
    }

    
    @IBAction func enterAdd(_ sender: Any) {
        notesInput = notesField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        CoreDataController.shared.addNotes(with: WANT, and: notesInput)
    }
    var WANT = WantTask()
    var GOT = GotTask()
    var NEED = NeedTask()
    
    public var textInput = String()
    public var priorityInput = String()
    public var dateInput = String()
    var notesInput = ""
    
    var num = 0
    
    
    @IBOutlet weak var notesField: CustomTextField!
    @IBOutlet weak var taskHere: UILabel!
    @IBOutlet weak var priorityHere: UILabel!
    @IBOutlet weak var dateHere: UILabel!
    
    
    // MARK: - Keyboard hiding
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        notesField.resignFirstResponder()
    }
    
}
