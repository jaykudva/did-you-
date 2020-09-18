//
//  SettingsViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/14/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet var bgbg: UIView!
    
    @IBAction func clickDarkTeal(_ sender: Any) {
        Theme.hello = "darkTeal"
        Theme.newColor(name:"darkTeal")
        bgbg.backgroundColor = Theme.theColor
        print(Theme.hello)
        
    }
    @IBAction func clickLightGreen(_ sender: Any) {
        Theme.hello = "lightGreen"
        Theme.newColor(name:"lightGreen")
        bgbg.backgroundColor = Theme.theColor
        print(Theme.hello)
    }
    
}
