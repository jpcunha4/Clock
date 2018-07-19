//
//  AlarmTableViewController.swift
//  Clock
//
//  Created by Joao Paulo Cunha Ávila on 06/07/18.
//  Copyright © 2018 Joao Paulo Cunha Ávila. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {
    
    @IBOutlet var alarmTableView: UITableView!
    var hourArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let today = Date()
        let calendar = Calendar.current
        
        for _ in 0...10{
            let hour:Int = calendar.component(.hour, from: today)
            let minute:Int = calendar.component(.minute, from:today)
            self.hourArray.append("\((hour<10) ? "0\(hour)" : "\(hour)"):\((minute<10) ? "0\(minute)" : "\(minute)")")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.hourArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell") as! AlarmTableViewCell
        cell.hourLabel.text = self.hourArray[indexPath.item]
        return cell
    }
    
    /*MARK: Alarm Switch
        This function is responsable for turning alarms on and off.
     */
    @IBAction func editAlarms(_ sender: UIBarButtonItem) {
        alarmTableView.isEditing = !alarmTableView.isEditing
        sender.title = alarmTableView.isEditing ? "Done" : "Edit"
        for rowNumber in 0..<self.hourArray.count{
            let cell = alarmTableView.cellForRow(at:IndexPath(row: rowNumber, section: 0)) as? AlarmTableViewCell
            cell?.alarmSwitch.isHidden = !(cell?.alarmSwitch.isHidden)!
            cell?.accessoryType = alarmTableView.isEditing ? UITableViewCellAccessoryType.disclosureIndicator:UITableViewCellAccessoryType.none
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.deleteCell(at: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "delete") { (action, view, completion) in
            self.deleteCell(at: indexPath)
            completion(true)
        }
        deleteAction.backgroundColor = .red
        deleteAction.title = "delete"
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }
    
    func deleteCell(at indexPath:IndexPath){
        self.hourArray.remove(at: indexPath.item)
        alarmTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

