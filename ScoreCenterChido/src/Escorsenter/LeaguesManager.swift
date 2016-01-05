//
//  LeaguesManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class LeaguesManager {
    
    let entityName = "League"
    
    //Get data from API
    
    func getLeaguesFromAPI(viewdelegate: ViewDelegate){
        
        var loader = LeagueLoader(viewdelegate: viewdelegate)
        
        loader.getLeagues()
        
    }
    
    //Get data from DB
    
    func getLeaguesFromDB() -> [LeagueDto]{
        var dataSource = DataSource(_entityName: entityName)
        var leaguesData = dataSource.readAll()
        var leagues = [LeagueDto]()
        for leagueData in leaguesData{
            
            leagues.append(LeagueDto.parseFromData(leagueData))
        }
        return leagues
    }
    
    //Add data to DB
    
    func addLeagueToDB(leagues: [LeagueDto]){
        
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAll()
        
        for league in leagues {
            dataSource.add(league.data(), id: league.id)
        }
    }
    
    //Favorite/not favorite methods
    
    func addToFavorites(id: Int64){
        
        var dataSource = DataSource(_entityName: entityName)
        
        dataSource.addToFavorites(id)
        
    }
    
    func removeFromFavorites(id: Int64) {
        var dataSource = DataSource(_entityName: entityName)
        
        dataSource.deleteFromFavorites(id)
    }
    
    func getFavorites() -> [LeagueDto]{
        
        var dataSource = DataSource(_entityName: entityName)
        var leaguesData = dataSource.readFavorites()
        var leagues = [LeagueDto]()
        for leagueData in leaguesData{
            leagues.append(LeagueDto.parseFromData(leagueData))
        }
        return leagues
    }
    
    func isFavorite(id: Int64) -> Bool{
        var favoriteLeagues = getFavorites()
        for league in favoriteLeagues {
            if league.id == id {
                return true
            }
        }
        return false
    }
    
}