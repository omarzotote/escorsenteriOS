//
//  NotificationViewController.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/7/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit
import EventKit
class NotificationViewController: UIViewController {

    @IBOutlet var addeventButton: UIButton!
    
    var notification : NotificationDto?
    @IBOutlet weak var NotificationDescription: UITextView!
    @IBOutlet var NotificationTitle: UITextView!
    @IBOutlet var NotificationDate: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = notification?.title
        self.NotificationDate.text = notification?.date
        self.NotificationTitle.text = notification?.title
        self.NotificationDescription.text = notification?.content
        
        //Notification?.date
        
        self.addeventButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddEvent(sender: AnyObject) {
        let eventStore = EKEventStore()
        switch EKEventStore.authorizationStatusForEntityType(EKEntityTypeEvent){
        case .Authorized:
            addNotificationToCalendar(eventStore)
        case .Denied:
            println("Access Denied")
        case .NotDetermined:
            eventStore.requestAccessToEntityType(EKEntityTypeEvent, completion:
                {[weak self] (granted: Bool, error: NSError!) -> Void in
                    if granted {
                        self!.addNotificationToCalendar(eventStore)
                    } else {
                        println("Access denied")
                    }
            })
        default:
            println("Case Default")
        }
    }
    
    @IBAction func addLocalNotification(sender: AnyObject) {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.category = "Nuevo Partido"
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "Woww it works!!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    
    func addNotificationToCalendar(store: EKEventStore) {
        let calendars = store.calendarsForEntityType(EKEntityTypeEvent) as! [EKCalendar]
        for calendar in calendars{
            if calendar.title == "TestCalendar"{
                let startDate = NSDate().dateByAddingTimeInterval(15 * 60 + 10)
                let endDate = startDate.dateByAddingTimeInterval(2 * 60 * 60)
                var event = EKEvent(eventStore: store)
                event.title = notification?.title
                event.location = "La cancha"
                event.calendar = calendar
                event.startDate = startDate
                event.endDate = endDate
                var alarm = EKAlarm(relativeOffset: -15 * 60)
                event.addAlarm(alarm)
                var error : NSError?
                let result = store.saveEvent(event, span: EKSpanThisEvent, error: &error)
                if result == false{
                    if let theError = error{
                        println("An error ocurred \(theError)")
                    }
                }
                else{
                    println("Event Added")
                }
            }
            
        }
    }

}
