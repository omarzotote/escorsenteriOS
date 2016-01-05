//
//  FutureMatchesLoader.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 28/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation


public class FutureMatchesLoader : LoaderDelegate {
    
    let viewDelegate : ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Loader Method
    
    func getFutureMatches(teamId :  Int64)
    {
        let pars = ["leagues", String(teamId), "futurematches"]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
    }
    
    //Para checar que la llamada fuera correcta y parsear los datos

    
    func RequestSuccess(data : NSData, list : Bool)
    {
        if(data.length == 0)
        {
            println("Future Matches returned null")
            return
        }
        let futureMatches = SeasonDto.parseFromData(data)
        viewDelegate?.RefreshView(futureMatches, append: 1)
        println("Future Matches success")
    }
    func RequestError(errorString :  String)
    {
        println(errorString)
    }
    
}