//
//  headerCell.swift
//  did you?
//
//  Created by Jay Kudva on 6/8/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class headerCell: UITableViewCell {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        headerLabel.shadowOffset = CGSize.zero
        headerLabel.shadowColor = UIColor.darkGray
    }
    
    func setup(array: [priorityLevel], section: Int) {
        let str = array[section].levelString
        headerLabel.text = str
//        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
//        let underlineAttributedString = NSAttributedString(string: str, attributes: underlineAttribute)
//
//        headerLabel.attributedText = underlineAttributedString
    }
    
}
