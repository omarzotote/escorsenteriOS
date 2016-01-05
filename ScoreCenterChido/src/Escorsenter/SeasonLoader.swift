//
//  SeasonLoader.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 15/09/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class SeasonLoader : LoaderDelegate
{
    let viewDelegate : ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    func RequestSuccess(data: NSData, list: Bool)
    {
        if (data.length == 0)
        {
            println("Season request success returned null")
            return
        }
        let season = SeasonDto.parseFromData(data)
        viewDelegate?.RefreshView(season, append:1)
        println("Season request success")
    }
    func RequestError(errorString : String)
    {
        println(errorString)
    }
    
    public func getFutureMatches(leagueId : Int64)
    {
        let dl = DataLoader(loaderdelegate : self)
        let pars : [String] = ["leagues", String(leagueId), "futurematches"]
        dl.loadDataGet(pars)
    }
    
    public func getPastMatches(leagueId: Int64)
    {
        let dl = DataLoader(loaderdelegate : self)
        let pars : [String] = ["leagues", String(leagueId), "pastmatches"]
        dl.loadDataGet(pars)
    }
    
    public func getScoreTable(leagueId: Int64)
    {
        let dl = DataLoader(loaderdelegate : self)
        let pars : [String] = ["leagues", String(leagueId), "table"]
        dl.loadDataGet(pars)
    }
    
}

















