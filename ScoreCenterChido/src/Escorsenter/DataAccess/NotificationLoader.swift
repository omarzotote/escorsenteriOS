//
//  NotificationLoader.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/26/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit
import CoreData

public class NotificationLoader: LoaderDelegate
{
    var pageSize : Int64 = 5
    var notificationsCount : Int64 = 0
    var lastNotificationId : Int64 = 0
    let viewDelegate :  ViewDelegate?
    
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    func mapNotification( notification : NotificationDto) -> NotificationDto
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        var newNotification = NSEntityDescription.insertNewObjectForEntityForName("Notification", inManagedObjectContext: managedContext) as! NotificationDto
        var newNotificationBuilder = newNotification.toBuilder()
        newNotificationBuilder.title = notification.title
        newNotificationBuilder.id = Int64(notification.id)
        newNotificationBuilder.content = notification.content
        newNotificationBuilder.date = notification.date
        newNotification = newNotificationBuilder.build()
        var error : NSError? = nil
        if !managedContext.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        return newNotification
    }
    
    //Para checar  que la llamada fuera correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list: Bool)
    {
        if(data.length == 0)
        {
            println("Notification request success returned null")
            return 
        }
        if(list)
        {
            let notifications = NotificationListDto.parseFromData(data)
            
            var nots : Array<NotificationDto> = []
            for not in notifications.items
            {
                nots.append(not)
                notificationsCount++
                if(not.id > lastNotificationId)
                {
                    lastNotificationId = not.id
                }
            }
            viewDelegate?.RefreshView(nots, append: 1)
        }
        else
        {
            let notification = NotificationDto.parseFromData(data)
            viewDelegate?.RefreshView(mapNotification(notification), append: 1)
        }
        println("Notification request success")
        println(lastNotificationId)
        println(notificationsCount)
    }
    
    func RequestError(errorString : String)
    {
        println(errorString)
    }
    
    //Loader Method
    
    public func getNotifications(teamIds : Array <Int64>, leagueIds : Array <Int64>)
    {
        var dl = DataLoader( loaderdelegate: self)
        
        var pars : [String] = ["notifications", "leagues"]
        for leagueId in leagueIds
        {
            pars.append(String(leagueId))
        }
        pars.append("teams")
        for teamId in teamIds
        {
            pars.append(String(teamId))
        }
        
        dl.loadDataGet(pars)
    }
}