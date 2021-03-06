//
//  Dispatch.swift
//  Contrivd
//
//  Created by Alex Quinlivan on 20/07/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

import Foundation

class Dispatch {
    
    class func delay(delay: Double, closure: () -> Void) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
