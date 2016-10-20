//
//  MasterTableViewController.swift
//  To-Do List V.2
//
//  Created by David Choi on 10/18/16.
//  Copyright © 2016 David Choi. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var listOfActivities = [activity]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        check24Hours()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func insertNewActivity(_ activityName: String, _ activityDetail: String) {
        
        listOfActivities.insert(activity(name: activityName, detail: activityDetail, time: NSDate(), checked: 0), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
    func check24Hours() {
        var count = 0
        let time = NSDate()
        for activity in listOfActivities {
            if activity.checked == 1 {
                
                let interval = time.timeIntervalSince(activity.time as Date)
                if interval > 86400 {
                    listOfActivities.remove(at: count)
                    let indexPath = IndexPath(row: count, section: 0)
                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    count -= 1
                }
            }
            count += 1
        }
    }
    
    func countCompletedActivities()-> Int {
        var count = 0
        for activity in listOfActivities {
            if activity.checked == 1 {
                count += 1
            }
        }
        return count
    }
    
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue) {
        let sourceViewController = sender.source as! ViewController
        
        let taskName = sourceViewController.taskName.text
        
        let taskDetail = sourceViewController.taskDetail.text
        
        if taskName != "" {
            insertNewActivity(taskName!, taskDetail!)
        }
        
        // Pull any data from the view controller which initiated the unwind segue.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stats" {
            let num = String(countCompletedActivities())
            
            let statVC : StatViewController = segue.destination as! StatViewController
            
            statVC.receivedString = num
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfActivities.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let cell = tableView.cellForRow(at: didSelectRowAt)
        
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
            listOfActivities[didSelectRowAt.row].checked = 1
            listOfActivities[didSelectRowAt.row].time = NSDate()
        } else {
            cell?.accessoryType = .none
            listOfActivities[didSelectRowAt.row].checked = 0
            listOfActivities[didSelectRowAt.row].time = NSDate()
        }
        tableView.deselectRow(at: didSelectRowAt, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var activity = listOfActivities[indexPath.row]
        
        cell.textLabel!.text = activity.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listOfActivities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
