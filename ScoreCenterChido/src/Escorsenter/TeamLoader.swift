//
//  TeamLoader.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/27/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//
import CoreData
import UIKit
public class TeamLoader: LoaderDelegate
{
    var pageSize : Int64 = 5
    var teamsCount : Int64 = 0
    var lastTeamId : Int64 = 0
    let viewDelegate :  ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Loader Methods
    
    public func getTeam(id : Int)
    {
        let pars : [String] = ["teams", String(id)]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
    }
    
    public func getTeams()
    {
        let pars : [String] = ["teams"]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
        
    }
    
    //Para checar si la llamada fue correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list :  Bool)
    {
        if(data.length == 0)
        {
            println("Team request success returned null")
            return
        }
        if(list)
        {
            var teams = TeamListDto.parseFromData(data)
            viewDelegate?.RefreshView(teams.items, append: 1)
        }
        else
        {
            let team = TeamDto.parseFromData(data)
            let teams : Array<TeamDto> = [team]
            viewDelegate?.RefreshView(teams, append: 1)
        }
        println("Team request success")
    }
    func RequestError(errorString : String)
    {
        println(errorString)
    }
    
}