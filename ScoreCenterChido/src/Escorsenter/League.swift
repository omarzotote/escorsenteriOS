//
//  League.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/23/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import CoreData

class League: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var region: NSNumber
    @NSManaged var leagueDescription: String
    @NSManaged var logo: String
    @NSManaged var favorite: NSNumber
    @NSManaged var loaded: NSNumber

}
