//∫∑
//  ScoreTableResultManager.swift
//  Escorsenter
//
//  Created by ∫∑ on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class ScoreTableResultsManager{
    
    let entityName = "ScoreTableResult"
    
    //Get data from API
    
    func getScoreTableResultFromAPI(viewdelegate: ViewDelegate, id: Int64) {
        
        var loader = ScoreTableResultLoader(viewdelegate: viewdelegate)
        
        loader.getScoreTableResult(id)
    }
    
    //Get specific data from DB
    
    func getScoreTableResultFromDBAtIndex(index: Int64) -> ScoreTableResultDto {
        
        var dataSource = DataSource(_entityName: entityName)
        var scoreTableResultData = dataSource.readAtIndex(index)
        var scoreTableResult = ScoreTableResultDto.parseFromData(scoreTableResultData!)
        
        return scoreTableResult
    }
    
    //Add data to local DB
    
    func addScoreTableResultToDB(scoreTableResult: ScoreTableResultDto){
        
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAtIndex(scoreTableResult.team.id)
        
        dataSource.add(scoreTableResult.data(), id: scoreTableResult.team.id)
    }
}