//
//  AddedViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/12/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class AddedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            self.dismiss(animated: true)
        }
    }

}
