//
//  CustomTextField.swift
//  did you?
//
//  Created by Jay Kudva on 6/5/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    var enableLongPressActions = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return enableLongPressActions
    }

}
