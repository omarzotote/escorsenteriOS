
//
//  NotificationsController.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/20/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class NotificationsController: UITableViewController, ViewDelegate{

    var notificationsArray : [NotificationDto] = []
    var notificationManager : NotificationsManager?
    var selectedNotification : NotificationDto?
    var loading : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationManager = NotificationsManager()
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("update"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        self.tableView.addSubview(refreshControl)
        update()
    }
    
    //Actualizar la vista cada que se selecciona
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0;
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        if (currentOffset > 50 && loading == false) {
            self.loading = true
            notificationManager?.getNotificationsFromAPI(self)
        }
        else if (currentOffset < 50)
        {
            self.loading = false
        }
    }
    
    //Swipe down to rtefresh methods (update and refreshView)
    
    func update()
    {
        notificationManager?.getNotificationsFromDB()
        notificationManager?.getNotificationsFromAPI(self)
        self.refreshControl?.endRefreshing()
    }
    
    func RefreshView(obj : AnyObject, append : Int)
    {
        //overlay?.removeFromSuperview()
        notificationManager?.addNotificationsToDB(obj as! [NotificationDto])
        notificationsArray = obj as! [NotificationDto]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return notificationsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let notification = notificationsArray[indexPath.row] as NotificationDto
        cell.textLabel!.text = notification.title
        cell.detailTextLabel?.text = notification.date
        return cell
    }
    
    //No s'e si sea necesario dividir las notificaciones, p.ej. en leidas y no leidas, si no, agregar header es innecesario
    
    /*
   override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String{
            return "Nuevas"
    }
    */


    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedNotification = notificationsArray[indexPath.row]
        performSegueWithIdentifier("NotShowNotificationSegue", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as! NotificationViewController
        destinationVC.notification = selectedNotification
        //destinationVC.titleForHeaderInSection = selectedLeague!.name
    }
}
