//
//  LeagueScoreTable.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 28/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class LeagueScoreTableResultLoader : LoaderDelegate {
    
    let viewDelegate : ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Loader Method
    
    func getLeagueScoreTableResult(teamId :  Int64)
    {
        let pars = ["leagues", String(teamId), "table"]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
    }
    
    //Para checar que la llamada fuera correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list : Bool)
    {
        if(data.length == 0)
        {
            println("League Score Table returned null")
            return
        }
        let pastMatches = SeasonDto.parseFromData(data)
        viewDelegate?.RefreshView(pastMatches, append: 3)
        println("League Score Table success")
    }
    func RequestError(errorString :  String)
    {
        println(errorString)
    }
    
}