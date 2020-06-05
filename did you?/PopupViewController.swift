//
//  PopupViewController.swift
//  did you?
//
//  Created by Jay Kudva on 6/5/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var popupVire: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // define a variable to store initial touch position
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    override func viewDidAppear(_ animated: Bool) {
        popupVire.layer.shadowOpacity = 1
        popupVire.layer.shadowOffset = CGSize.zero
        popupVire.layer.shadowColor = UIColor.darkGray.cgColor
        popupVire.layer.cornerRadius = 8
    }

    
    @IBAction func panGestureHandler(_ sender: Any) {
        let touchPoint = (sender as AnyObject).location(in: self.view?.window)

        if (sender as AnyObject).state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        } else if (sender as AnyObject).state == UIGestureRecognizer.State.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if (sender as AnyObject).state == UIGestureRecognizer.State.ended || (sender as AnyObject).state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
        
    }
    
    
    

}
