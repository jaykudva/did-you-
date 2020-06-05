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
    var input = ""
//    var toolBar = UIToolbar()
//    var picker  = UIPickerView()
    
    @IBAction func handleSelection(_ sender: UIButton) {
        
        
        
//        picker = UIPickerView.init()
//        picker.delegate = self
//        picker.isOpaque = true
//        picker.setValue(color2, forKey: "backgroundColor")
//        picker.setValue(UIColor.black, forKey: "textColor")
//        picker.autoresizingMask = .flexibleWidth
//        picker.contentMode = .center
//        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
//        self.view.addSubview(picker)
//
//        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
//        toolBar.barStyle = UIBarStyle.black
//        toolBar.isTranslucent = true
//        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
//        self.view.addSubview(toolBar)
        
    }
    

    @IBOutlet weak var pleaseChange: UIButton!
    
    @IBOutlet weak var priorityField: CustomTextField!
    
    let priorities = ["need", "will", "want"]
    var pickerView = UIPickerView()
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
        input = taskInput.text!
        CoreDataController.shared.addTask(with: input, priority: 2, and: Date())
        taskInput.text = ""
    }
}


