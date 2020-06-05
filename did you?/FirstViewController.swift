//
//  FirstViewController.swift
//  did you?
//
//  Created by Jay Kudva on 5/23/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    var responses: [String] = ["task1", "task2"]
    var err = "nothing new"
    var taskMsg = ""
    var priorityLvl = ""
    var priorityNum:Int16 = 0
//    var toolBar = UIToolbar()
//    var picker  = UIPickerView()
    
    @IBOutlet weak var popupViewButton: UIButton!
    @IBOutlet weak var priorityField: CustomTextField!
    
    let priorities = ["need", "will", "want"]
    var pickerView = UIPickerView()
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priorities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priorityField.text = priorities[row]
        priorityField.resignFirstResponder()
    }
    
    var num = 0
    @IBOutlet weak var taskInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskInput.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        priorityField.inputView = pickerView
        priorityField.textAlignment = .center
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if num == 0 {
            popupViewButton.sendActions(for: .touchUpInside)
            num += 1
        }
        
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func enterTap(_ sender: Any) {
        taskMsg = taskInput.text!
        priorityLvl = priorityField.text!
        
        if priorityLvl == "need" {
            priorityNum = 3
        } else if priorityLvl == "will" {
            priorityNum = 2
        } else {
            priorityNum = 1
        }
        CoreDataController.shared.addTask(with: taskMsg, priority: priorityNum, and: Date())
        taskInput.text = ""
    }
}


