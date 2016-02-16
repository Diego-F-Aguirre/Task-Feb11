//
//  Task.swift
//  Feb11
//
//  Created by Retika Kumar on 2/11/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    
    private let nameKey = "nameKey"
    private let notesKey = "notesKey"
    private let dueKey = "dueKey"
    private let isCompleteKey = "isCompleteKey"
    
    
    
    var name: String
    var notes: String?
    var due: String?
    var isComplete: Bool
    
    init(name:String, notes:String?, due:String?, isComplete: Bool) {
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
        
        
        
    }
    @objc required init?(coder aDecoder: NSCoder) {
        guard let  name = aDecoder.decodeObjectForKey(nameKey) as? String else {
            self.name = " "
            self.notes = " "
            self.due = " "
            self.isComplete = false
            super.init()
            return nil
            
        }
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(notesKey) as? String
        self.due = aDecoder.decodeObjectForKey(dueKey) as? String
        self.isComplete = aDecoder.decodeObjectForKey(isCompleteKey) as! Bool
        super.init()
        
        
    }
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeObject(notes, forKey: notesKey)
        aCoder.encodeObject(due, forKey: dueKey)
        aCoder.encodeObject(isComplete, forKey: isCompleteKey)
        
    }
    
    
}

func ==(lhs: Task, rhs: Task) -> Bool{
    return lhs.name == rhs.name && lhs.notes == rhs.notes && lhs.isComplete == rhs.isComplete
    
    
}





































