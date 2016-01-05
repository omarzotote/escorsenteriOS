//
//  ScoreTableResult.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 27/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class ScoreTableResultLoader: LoaderDelegate
{
    let viewDelegate : ViewDelegate?
    
    init(viewdelegate : ViewDelegate?)
    {
        viewDelegate = viewdelegate
    }
    
    //Get data from DB
    
    func getScoreTableResult(teamId :  Int64)
    {
        let pars = ["teams", String(teamId), "score"]
        let dl = DataLoader(loaderdelegate: self)
        dl.loadDataGet(pars)
    }
    
    //Checar si la llamada fue correcta y parsear los datos
    
    func RequestSuccess(data : NSData, list : Bool)
    {
        if(data.length == 0)
        {
            println("Score Table Result returned null")
            return
        }
        let scoreTableResult = ScoreTableResultDto.parseFromData(data)
        viewDelegate?.RefreshView(scoreTableResult, append: 1)
        println("Score Table Result success")
    }
    func RequestError(errorString :  String)
    {
        println(errorString)
    }
}
