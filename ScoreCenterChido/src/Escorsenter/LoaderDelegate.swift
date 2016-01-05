//
//  LoaderDelegate.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/7/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

protocol LoaderDelegate
{
    func RequestSuccess(data : NSData, list : Bool)
    func RequestError(errorString :  String)
}