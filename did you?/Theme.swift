//
//  Theme.swift
//  did you?
//
//  Created by Jay Kudva on 9/18/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class Theme {
//    static let mainFontName = ""
    static var theColor = UIColor(named:hello)
    public static var hello:String = "lightBlue"
    
    static func newColor(name:String){
        let newColor:UIColor = UIColor(named: name)!
        Theme.theColor = newColor
    }
}
