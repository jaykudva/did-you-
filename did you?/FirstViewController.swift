//
//  FirstViewController.swift
//  did you?
//
//  Created by Jay Kudva on 5/23/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var taskList: [String] = ["1", "2", "3"]
    var str = ""
    var err = "nothing new"
    
    @IBOutlet weak var taskInput: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskInput.delegate = self
        if taskList.count > 0 {
            loadUp()
        }
        // Do any additional setup after loading the view.
    }
    
    func loadUp() {
        for s in taskList {
            str = str + s + "\n"
        }
    }


    @IBAction func enterTap(_ sender: Any) {
        taskList.append(taskInput.text ?? "no task")
        textView.text = str + "\n" + taskInput.text!
        taskInput.text = ""
        
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
