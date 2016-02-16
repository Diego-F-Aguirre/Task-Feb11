//
//  TaskController.swift
//  Feb11
//
//  Created by Retika Kumar on 2/11/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation

class TaskController{
    private let taskKey = "tasks"
    
    static let sharedInstance = TaskController()
    
    private var taskArray: [Task] = []
    
    var completedTasks: [Task] {
        return taskArray.filter({
            $0.isComplete.boolValue
        })
    }
    
    var incompleteTasks: [Task] {
        return taskArray.filter({ (task) -> Bool in
            !task.isComplete.boolValue
        })
    }
    
    init() {
        taskArray = mockTasks
    }
    
    func addTask(task: Task) {
        taskArray.append(task)
        saveToPersistantStorage()
    }
    
    func removeTask(indexPath: NSIndexPath) {
        taskArray.removeAtIndex(indexPath.row)
        saveToPersistantStorage()
    }
    
    
    
    
    var mockTasks: [Task] {
        
        let task1 =  Task(name: "Retika", notes: "Go away", due: nil, isComplete: false)
        let task2 =  Task(name: "Diego", notes: "Come eat", due: nil, isComplete: true)
        let task3 =  Task(name: "Kaytee", notes: "pls stay", due: nil, isComplete: true)
        
        let finalTask = [task1, task2, task3]
        return finalTask
        
    }
    
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        return entriesPath
        
    }
    
    func saveToPersistantStorage() {
        NSKeyedArchiver.archiveRootObject(self.taskArray, toFile: self.filePath(taskKey))
    }
    
    
}
