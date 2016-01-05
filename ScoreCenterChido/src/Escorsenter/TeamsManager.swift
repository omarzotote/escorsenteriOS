
//
//  TeamsManager.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 10/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class TeamsManager {
    
    let entityName = "Team"
    
    //Get teams from API
    
    func getTeamsFromAPI(viewdelegate: ViewDelegate){
        
        var loader = TeamLoader(viewdelegate: viewdelegate)
        
        loader.getTeams()
    }
    
    // Get data from local DB
    
    func getTeamsFromDB() -> [TeamDto]{
        var dataSource = DataSource(_entityName: entityName)
        var teamsData = dataSource.readAll()
        var teams = [TeamDto]()
        for teamData in teamsData{
            teams.append(TeamDto.parseFromData(teamData))
        }
        return teams
    }
    
    //Add data to local DB
    
    func addTeamsToDB(teams: [TeamDto]){
        
        var dataSource = DataSource(_entityName: entityName)
        dataSource.deleteAll()
        
        for team in teams {
            dataSource.add(team.data(), id: team.id)
        }
    }
    
    //Favorite/ not favorite methods
    
    func addToFavorites(id: Int64){
        
        var dataSource = DataSource(_entityName: entityName)
        
        dataSource.addToFavorites(id)
        
    }
    
    func removeFromFavorites(id: Int64) {
        var dataSource = DataSource(_entityName: entityName)
        
        dataSource.deleteFromFavorites(id)
    }
    
    func getFavorites() -> [TeamDto]{
        
        var dataSource = DataSource(_entityName: entityName)
        var teamsData = dataSource.readFavorites()
        var teams = [TeamDto]()
        for teamData in teamsData{
            teams.append(TeamDto.parseFromData(teamData))
        }
        return teams
    }
    
    func isFavorite(id: Int64) -> Bool {
        var favoriteTeams = getFavorites()
        for team in favoriteTeams {
            if team.id == id {
                return true
            }
        }
        return false
    }
    
    
}