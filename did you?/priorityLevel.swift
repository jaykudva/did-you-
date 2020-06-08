//
//  priorityLevel.swift
//  did you?
//
//  Created by Jay Kudva on 6/7/20.
//  Copyright © 2020 Jay Kudva. All rights reserved.
//

import UIKit

class priorityLevel: NSObject {
    
    var levelString = String()
    var levelNum = Int()
    var quantity = Int()
    
    public static var needAmt = Int()
    public static var gotAmt = Int()
    public static var wantAmt = Int()
    
    public static var amtArray = [needAmt, gotAmt, wantAmt]
}
