//
//  Notification.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/15/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import CoreData

class Notification: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var content: String
    @NSManaged var date: String

}
