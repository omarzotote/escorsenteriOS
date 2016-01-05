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

class DataSource {
    
    let entityName: String
    var appDel:AppDelegate!
    var context:NSManagedObjectContext!
    
    init(_entityName: String) {
        entityName = _entityName
        appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        context =  appDel.managedObjectContext
    }
    
    func add(object: NSData, id: Int64) {
        var newObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context)
        newObject.setValue(NSNumber(longLong: id), forKey: "id")
        newObject.setValue(object, forKey: "object")
        newObject.setValue(false, forKey: "favorite")
        
        context.save(nil)
    }
    
    func addToFavorites(id: Int64){
        let allResults = getResults()
        
        for result in allResults {
            if (result.valueForKey("id") as? Int) == NSNumber(longLong: id){
                result.setValue(true, forKey: "favorite")
            }
        }
        
        context.save(nil)
    }
    
    func readAtIndex(id: Int64) -> NSData?{
        var objects = [NSData]()
        let allResults = getResults()
        
        for result in allResults {
            if (result.valueForKey("id") as? Int) == NSNumber(longLong: id){
                objects.append(result.valueForKey("object") as! NSData)
            }
        }
        
        if objects.count == 0 {
            return  nil
        }
        return objects[0]
    }
    
    func readAll() -> [NSData] {
        var objects = [NSData]()
        let allResults = getResults()
        
        for result in allResults {
            objects.append(result.valueForKey("object") as! NSData)
        }
        
        return objects
    }
    
    func readFavorites() -> [NSData] {
        var objects = [NSData]()
        let allResults = getResults()
        
        for result in allResults {
            if (result.valueForKey("favorite") as! Bool) {
                objects.append(result.valueForKey("object") as! NSData)
            }
        }
        
        return objects
    }
    
    func deleteAtIndex(id: Int64){
        let allResults = getResults()
        
        for result in allResults {
            if (result.valueForKey("id") as! Int) == NSNumber(longLong: id) {
                context.deleteObject(result)
            }
        }
        
        context.save(nil)
    }
    
    func deleteAll(){
        let allResults = getResults()
        
        for result in allResults {
            context.deleteObject(result)
        }
        
        context.save(nil)
    }
    
    func deleteFromFavorites(id: Int64){
        let allResults = getResults()
        
        for result in allResults {
            if (result.valueForKey("id") as! Int) == NSNumber(longLong: id) {
                result.setValue(false, forKey: "favorite")
            }
        }
        
        context.save(nil)
    }
    
    private func getResults() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        return context.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObject]
    }
}