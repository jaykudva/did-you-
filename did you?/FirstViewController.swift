//
//  FirstViewController.swift
//  did you?
//
//  Created by Jay Kudva on 5/23/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // string to obtain task message
    var taskMsg = ""
    // string with whitespace removed of task
    var trimmed = ""
    // string to store priority level message
    var priorityLvl = ""
    // int to store priority level number
    var priorityNum:Int16 = 0
    // virtually hidden button that used to trigger initial pop-up on initial app launch
    @IBOutlet weak var popupViewButton: UIButton!
    // text field used to manipulate priority level selector, triggers priorityPickerView
    @IBOutlet weak var priorityField: CustomTextField!
    // array of different priorities
    let priorities = ["select", "need", "got", "want"]
    // instantiate UIPickerView to be triggered on priorityField press
    var pickerView = UIPickerView()
    // shrink length of characters needed to trigger UserDefaults
    let defaults = UserDefaults.standard
    // store if this is initial app launch or not
    var num = 0
    // text field to input task
    @IBOutlet weak var taskInput: UITextField!
    
    
    public static var hello = 2
    
    
    

    // MARK: - UIPickerView Shenanigans
    
    // # of columns in priorityPickerView
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // font and font size of priorityPickerView rows
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.text = priorities[row]
        if pickerLabel.text == "select" {
            pickerLabel.textColor = UIColor.darkGray
        }
        pickerLabel.font = UIFont(name: "SFProDisplay-Bold", size: 25) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    // row height of priorityPickerView
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    // number of rows in priorityPickerView
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorities.count
    }
    
    // setting priorityField with selected option from priorityPickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if priorities[row] == "select" {
            priorityField.text = "need"
        } else {
            priorityField.text = priorities[row]
        }
//        priorityField.setUnderLine()
        priorityField.resignFirstResponder()
    }
    
    @IBOutlet weak var settingsIcon: UIButton!
    
    
    // MARK: - General App Load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        settingsIcon.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        settingsIcon.isHidden = true
    }
    
    // assigning delegates and sources on initial app launch
    override func viewDidLoad() {
        super.viewDidLoad()
        taskInput.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // showing priorityPickerView when priority is selected
        priorityField.inputView = pickerView
        priorityField.textAlignment = .center
        
        // checking if this is initial app launch to show pop-up
        num = defaults.integer(forKey: "popupNoMore")
        
//        priorityField.setUnderLine()
        
    }
    
    // determines if initial popup is shown
    override func viewDidAppear(_ animated: Bool) {
        if num == 0 {
            popupViewButton.sendActions(for: .touchUpInside)
            num = 1
            // uses userdefaults to store whether popup should be shown
            defaults.set(num, forKey: "popupNoMore")
        }
        
    }
    
    // MARK: - App tap & engagement
    // after option is selected, UIPickerView or keyboard will be dismissed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // execute when add task button is selected
    @IBAction func enterTap(_ sender: Any) {
        
        // obtain task message and priority level
        taskMsg = taskInput.text!
        trimmed = taskMsg.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed != "" {
            priorityLvl = priorityField.text!
            
            // parse priority level into number, with default level of want/"1"
            if priorityLvl == "need" {
                priorityNum = 3
            } else if priorityLvl == "got" {
                priorityNum = 2
            } else {
                priorityNum = 1
                priorityLevel.wantAmt += 1
            }
            
            // store task in memory
            CoreDataController.shared.addTask(with: trimmed, priority: priorityNum, and: Date())
            
            print("this was tapped")
            
            // set task input back to empty
            taskInput.text = ""
        }
    }
}


