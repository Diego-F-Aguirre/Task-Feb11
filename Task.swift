//
//  Task.swift
//  Feb11
//
//  Created by Diego Aguirre on 2/16/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation
import CoreData

@objc(Task)
class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    convenience init(name: String, notes: String?, due: NSDate? = nil, isComplete: Bool = false, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        // there is no graceful way to respond to a failure on NSEntityDescription.entityForName, force unwrapping and forcing a crash is the desired behavior for this app
        
        // designated initializer
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
        
        
        // Set properties here
    }

}
