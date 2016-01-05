//
//  Team.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/23/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import CoreData

class Team: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var teamDescription: String
    @NSManaged var logo: String
    @NSManaged var leagueId: NSNumber
    @NSManaged var loaded: NSNumber
    @NSManaged var favorite: NSNumber

}
