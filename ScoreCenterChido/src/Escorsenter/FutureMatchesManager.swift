//
//  FutureMatchesManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation


public class FutureMatchesManager{
    
    let entityName = "FutureMatches"
    
    //Get data from API
    
    func getfutureMatchesFromAPI(viewdelegate: ViewDelegate, leagueId: Int64) {
        
        var loader = FutureMatchesLoader(viewdelegate: viewdelegate)
        
        loader.getFutureMatches(leagueId)
    }
    
    //Get specific data from DB
    
    func getFutureMatchesFromDBAtIndex(index: Int64) -> SeasonDto{
        
        var dataSource = DataSource(_entityName: entityName)
        var futureMatchesData = dataSource.readAtIndex(index)
        if futureMatchesData==nil {
            return SeasonDto()
        }
        var futureMatches = SeasonDto.parseFromData(futureMatchesData!)
        
        return futureMatches
    }
    
    //Add data to local DB
    
    func addFutureMatchesToDB(futureMatches: SeasonDto){
        
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAtIndex(futureMatches.league)
        
        dataSource.add(futureMatches.data(), id: futureMatches.league)
        
    }
    
}