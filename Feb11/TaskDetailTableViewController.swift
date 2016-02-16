//
//  TaskDetailTableViewController.swift
//  Feb11
//
//  Created by Retika Kumar on 2/11/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?

    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var dueLabel: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var dueDateValue: NSDate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueLabel.inputView = dueDatePicker

       
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let currentTask = task {
            updateWithTask(currentTask)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        self.dueLabel.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
   
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        nameLabel.resignFirstResponder()
        dueLabel.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        updateTask()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func updateTask() {
        
        let name = nameLabel.text
        let due = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            task.name = name!
            task.due = due
            task.notes = notes
        } else {
            
            let newTask = Task(name: name!, notes: notes, due: due)
            TaskController.sharedInstance.addTask(newTask)
        }
    }
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    func updateWithTask(task: Task) {
        nameLabel.text = task.name
        
        if let dueDate = task.due{
            dueLabel.text = String(dueDate)
        }
        
        if let notes = task.notes {
            notesTextView.text = notes
        }
    }
    
}



















