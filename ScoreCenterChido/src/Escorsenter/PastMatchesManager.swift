//
//  PastMatchesManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class PastMatchesManager{
    
    let entityName = "PastMatches"
    
    //Get data from API
    
    func getPastMatchesFromAPI(viewdelegate: ViewDelegate, leagueId: Int64) {
        
        var loader = PastMatchesLoader(viewdelegate: viewdelegate)
        
        loader.getPastMatches(leagueId)
    }
    
    //GEt specific data from DB
    
    func getPastMatchesFromDBAtIndex(index: Int64) -> SeasonDto{
        
        var dataSource = DataSource(_entityName: entityName)
        var pastMatchesData = dataSource.readAtIndex(index)
        if pastMatchesData==nil {
            return SeasonDto()
        }
        var pastMatches = SeasonDto.parseFromData(pastMatchesData!)
        
        return pastMatches
    }
    
    //Add data to local DB
    
    func addPastMatchesToDB(pastMatches: SeasonDto){
        
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAtIndex(pastMatches.league)
        
        dataSource.add(pastMatches.data(), id: pastMatches.league)

    }
    
}