//
//  TeamViewController.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/20/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class TeamViewController: UITableViewController {
    
    let ds1 : [String] = ["Pirules", "Hector Hdz"]
    let ds2 : [String] = ["Cremeria Jimenez", "Tomates Rojos"]
    let navigationSegues : [String] = ["showLeagueSegue", "showTeamSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the notifications
        for position in 0..<ds1.count{
            var indexPath = NSIndexPath(forRow: position, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        for position in 0..<ds2.count{
            var indexPath = NSIndexPath(forRow: position, inSection: 1)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        switch section {
        case 0:
            return "Ligas"
        case 1:
            return "Equipos"
        default:
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        switch section {
        case 0:
            return ds1.count
        case 1:
            return ds2.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var result : String = "no hubo"
        switch indexPath.section {
            case 0:
                result = ds1[indexPath.row]
            break
            case 1:
                result = ds2[indexPath.row]
                break
        default:
            break
        }
        cell.textLabel!.text = result
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(navigationSegues[indexPath.section], sender: tableView)
    }
    
}
