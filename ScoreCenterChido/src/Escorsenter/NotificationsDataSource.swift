//
//  NotificationsDataSource.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 04/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NotificationsDataSource {
    
    let entityName = "Notification"
    var appDel:AppDelegate!
    var context:NSManagedObjectContext!
    
    init() {
        appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        context =  appDel.managedObjectContext
    }
    
    func add(notification: NotificationDto) {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", notification.id)
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        if fetchResults.count != 0{
            let result = fetchResults[0]
            result.setValue(notification.data(), forKey: "object")
            
            context.save(nil)
            return
        }
        
        var newObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context)
        newObject.setValue(notification.id as? AnyObject, forKey: "id")
        newObject.setValue(notification.data(), forKey: "object")
        newObject.setValue(false, forKey: "favorite")
        
        context.save(nil)
    }
    
    func addToFavorites(id: Int){
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        if fetchResults.count != 0{
            let result = fetchResults[0]
            result.setValue(true, forKey: "favorite")
                
            context.save(nil)
        }
    }
    
    func readAll() -> [NotificationDto] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        var notifications = [NotificationDto]()
        
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        for result in fetchResults {
            notifications.append(NotificationDto.parseFromData(result.valueForKey("object") as! NSData))
        }
        
        return notifications
    }
    
    func readFavorites() -> [NotificationDto] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        var notifications = [NotificationDto]()
        
        fetchRequest.predicate = NSPredicate(format: "favorite = %@", true)
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        for result in fetchResults {
            notifications.append(NotificationDto.parseFromData(result.valueForKey("object") as! NSData))
        }
        
        return notifications
    }
    
    func delete(id: Int){
        let fetchRequest = NSFetchRequest(entityName: entityName)

        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        if fetchResults.count != 0{
            let result = fetchResults[0]
            context.deleteObject(result)
            
            context.save(nil)
        }
    }
    
    func deleteFromFavorites(id: Int){
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
        if fetchResults.count != 0{
            let result = fetchResults[0]
            result.setValue(false, forKey: "favorite")
            
            context.save(nil)
        }
    }
}