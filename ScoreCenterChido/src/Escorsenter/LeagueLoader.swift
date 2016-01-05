//
//  LeagueLoader.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/27/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit
import CoreData

public class LeagueLoader : LoaderDelegate
{
    let viewDelegate :  ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Para checar si la llamada fue correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list: Bool)
    {
        if(data.length == 0)
        {
            println("League request success returned null")
            return
        }
        if(list)
        {
            let leagues = LeagueListDto.parseFromData(data)
            viewDelegate?.RefreshView(leagues.items, append: 1)
        }
        else
        {
            let league = LeagueDto.parseFromData(data)
            viewDelegate?.RefreshView(league, append: 1)
        }
        println("League request success")
    }
    func RequestError(errorString : String)
    {
        println(errorString)
    }
    
    //Loader Methods
    
    public func getLeague(id : Int)
    {
        let dl = DataLoader( loaderdelegate: self)
        let pars : [String] = ["leagues", String(id)]
        dl.loadDataGet(pars)
    }
    
    public func getLeagues()
    {
        let dl = DataLoader( loaderdelegate: self)
        let pars : [String] = ["leagues"]
        dl.loadDataGet(pars)
    }
    
    
}