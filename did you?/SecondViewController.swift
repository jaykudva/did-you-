//
//  SecondViewController.swift
//  did you?
//
//  Created by Jay Kudva on 5/23/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.text = ""
        
        for curr in taskController.getToDos() {
            textView.text = "\(textView.text ?? "not")\n\(curr.task)\n\(curr.priority)"
        }
        
        
    }


    @IBOutlet weak var textView: UITextView!
}

