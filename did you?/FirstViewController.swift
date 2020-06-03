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
    public var str = ""
    var new = ""
    var input = ""
    var err = "nothing new"
//    var tasks: [String] = UserDefaults.standard.object(forKey: "myKey") as? [String] ?? []
    
    @IBOutlet weak var taskInput: UITextField!
    
    
    @IBOutlet weak var textViewing: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskInput.delegate = self
    
    }
    override func viewDidAppear(_ animated: Bool) {
        loadUp()
        textViewing.text = str
    }
    
    func loadUp() {
        str = ""
        for s in responses {
            str = str + s + "\n"
        }
    }
    func loadUp(_ list : [String]) {
        for s in list {
            new = new + s + "\n"
        }
    }

    
    
    @IBAction func retrieve(_ sender: Any) {
        textViewing.text = ""
        responses = UserDefaults.standard.stringArray(forKey: "responses") ?? [String]()
        loadUp(responses)
        textViewing.text = new
    }
    
    
    @IBAction func enterTap(_ sender: Any) {
        input = taskInput.text!
        let t = taskObject.init()
        t.task = input
        t.priority = 2
        taskController.addToDo(t)
        responses.append(input)
        loadUp()
        textViewing.text = str
        taskInput.text = ""
        print(responses)
        UserDefaults.standard.set(responses, forKey: "responses")
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
