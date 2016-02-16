//
//  DateHelpers.swift
//  Feb11
//
//  Created by Diego Aguirre on 2/12/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation

extension NSDate {
    
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        return formatter.stringFromDate(self)
    }

}