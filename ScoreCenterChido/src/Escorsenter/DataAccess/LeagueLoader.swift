//
//  LeagueLoader.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/27/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

public class LeagueLoader
{
    init()
    {}
    
    public func getLeagues() -> Array<LeagueDTO>
    {
        let leagues : LeagueListDTOBuilder = LeagueListDTO.builder()
        leagues.setPageTotal(1)
        leagues.setPageNumber(1)
        for var count = 0; count<10; count++
        {
            var item = LeagueDTO.builder()
            item.setId(count.toIntMax())
            item.setName("Liga # \(count)")
            leagues.items.append(item.build())
        }
        return leagues.build().items
    }
    
}