//
//  AddedViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/12/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class AddedViewController: UIViewController {

    @IBOutlet weak var popup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        popup.layer.shadowOpacity = 1
        popup.layer.shadowOffset = CGSize.zero
        popup.layer.shadowColor = UIColor.darkGray.cgColor
        popup.layer.cornerRadius = 8
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            self.dismiss(animated: true)
        }
    }

}
