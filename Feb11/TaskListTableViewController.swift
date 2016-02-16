//
//  TaskListTableViewController.swift
//  Feb11
//
//  Created by Retika Kumar on 2/11/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.incompleteTasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! ButtonTableViewCell

        // Configure the cell...
        let task = TaskController.sharedInstance.incompleteTasks[indexPath.row]
        
        
        cell.updateWithTask(task)
        cell.delegate = self

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            TaskController.sharedInstance.removeTask(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailSegue" {
            let destinationViewController = segue.destinationViewController as? TaskDetailTableViewController
            
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                let selectedTask = TaskController.sharedInstance.incompleteTasks[selectedRow]
                destinationViewController?.task = selectedTask
            }
            
//            if let taskDetailViewController = destinationViewController {
//                _ = taskDetailViewController.view
//                
//                if let selectedRow = tableView.indexPathForSelectedRow?.row {
//                    let selectedTask = TaskController.sharedInstance.incompleteTasks[selectedRow]
//                    taskDetailViewController.updateWithTask(selectedTask)
//                }
//            }
        }
    }
}

extension TaskListTableViewController: ButtonTableViewCellDelegate{
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {

     let indexPath = tableView.indexPathForCell(sender)!
        
        let task = TaskController.sharedInstance.incompleteTasks[indexPath.row]
        task.isComplete = !task.isComplete.boolValue
        TaskController.sharedInstance.saveToPersistantStorage()
        
        tableView.reloadData()
        
    }
    
}
