//
//  FirstViewController.swift
//  did you?
//
//  Created by Jay Kudva on 5/23/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    var responses: [String] = ["task1", "task2"]
    var err = "nothing new"
    var input = ""
    
    @IBOutlet weak var taskInput: UITextField!
    
    
    @IBOutlet weak var textViewing: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskInput.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
//    func loadUp() {
//        str = ""
//        for s in responses {
//            str = str + s + "\n"
//        }
//    }
//    func loadUp(_ list : [String]) {
//        for s in list {
//            new = new + s + "\n"
//        }
//    }
    
    
    @IBAction func enterTap(_ sender: Any) {
        input = taskInput.text!
        CoreDataController.shared.addTask(with: input, priority: 2, and: Date())
        taskInput.text = ""
    }
    
    
    
    
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
