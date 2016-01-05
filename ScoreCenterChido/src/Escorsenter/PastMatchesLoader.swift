//
//  PastMatchesLoader.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 28/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class PastMatchesLoader : LoaderDelegate {
    
    let viewDelegate : ViewDelegate?
    
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Loader Method
    
    func getPastMatches(teamId :  Int64)
    {
        let pars = ["leagues", String(teamId), "pastmatches"]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
    }
    
    //Para checar que la llamada fuera correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list : Bool)
    {
        if(data.length == 0)
        {
            println("Past Matches returned null")
            return
        }
        let pastMatches = SeasonDto.parseFromData(data)
        viewDelegate?.RefreshView(pastMatches, append: 2)
        println("Past Matches success")
    }
    func RequestError(errorString :  String)
    {
        println(errorString)
    }
    
}