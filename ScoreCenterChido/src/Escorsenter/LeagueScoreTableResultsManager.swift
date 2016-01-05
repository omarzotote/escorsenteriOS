//
//  LeagueScoreTableResultsManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class LeagueScoreTableResultsManager{
    
    let entityName = "ScoreTableResult"
    
    //Get data from API
    
    func getLeagueScoreTableResultFromAPI(viewdelegate: ViewDelegate, id: Int64) {
        
        var loader = LeagueScoreTableResultLoader(viewdelegate: viewdelegate)
        
        loader.getLeagueScoreTableResult(id)
    }
    
    //Get specific data from DB
    
    func getLeagueScoreTableResultFromDBAtIndex(index: Int64) -> SeasonDto {
        
        var dataSource = DataSource(_entityName: entityName)
        var leagueScoreTableResultData = dataSource.readAtIndex(index)
        if leagueScoreTableResultData==nil {
            return SeasonDto()
        }
        var leagueScoreTableResult = SeasonDto.parseFromData(leagueScoreTableResultData!)
        
        return leagueScoreTableResult
        
    }
    
    //Add data to local DB
    
    func addLeagueScoreTableResultToDB(leagueScoreTableResult: SeasonDto){
        
        var dataSource = DataSource(_entityName: entityName)
        
        dataSource.deleteAtIndex(leagueScoreTableResult.league)
        
        dataSource.add(leagueScoreTableResult.data(), id: leagueScoreTableResult.league)
    }
}