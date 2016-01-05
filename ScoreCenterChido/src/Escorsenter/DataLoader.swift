//
//  DataLoader.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/28/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit
import Foundation

public class DataLoader : NSObject, NSURLConnectionDelegate
{
    
    var apiMutableData : NSMutableData = NSMutableData()
    var loaderDelegate : LoaderDelegate?
    
    
    init(loaderdelegate : LoaderDelegate)
    {
        super.init()
        loaderDelegate = loaderdelegate
    }
    
    func createRequest(parameters : Array<String>) -> NSMutableURLRequest
    {
        var urlbuilder :  NSMutableString = "http://192.168.0.111/api"
        
        for value in parameters
        {
            if value != ""
            {
                urlbuilder.appendString("/")
                urlbuilder.appendString(value)
            }
        }
        println(urlbuilder)
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlbuilder as String)!)
        request.setValue("application/x-protobuf", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-protobuf", forHTTPHeaderField: "Accept")
        request.setValue("HWKNFPASEOBG635581103711256022", forHTTPHeaderField: "Session-Token")
        request.timeoutInterval = 30
        return request
    }
    
    func loadDataGet(parameters : Array<String>)
    {
        let request : NSMutableURLRequest = createRequest(parameters)
        let currentConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    
    func loadDataPost (parameters : Array<String>, postObject : Dictionary<String, String>)
    {
        let request : NSMutableURLRequest = createRequest(parameters)
        request.HTTPMethod = "POST"
        let postData : NSData = NSData() //TODO send proto
        request.HTTPBody = postData
        let currentConnection : NSURLConnection = NSURLConnection (request: request, delegate: self, startImmediately: true)!
    }
    
    func connection (didReceiveResponse: NSURLConnection!, didReceiveResponse response : NSURLResponse!)
    {
        self.apiMutableData.length = 0
    }
    
    func connection (connection : NSURLConnection!, didReceiveData data : NSData!)
    {
        self.apiMutableData.appendData(data)
    }
    
    public func connection(conn:NSURLConnection, didFailWithError error:NSError)
    {
        var errorString = "Error"
        if(error.code == NSURLErrorTimedOut)
        {
            errorString = "TimeOut"
        }
        println(error.description)
        
        loaderDelegate?.RequestError(errorString)
    }
    
    func connectionDidFinishLoading ( connection : NSURLConnection! )
    {
        var list = true
        if((connection.currentRequest.URL!.absoluteString?.rangeOfString("?id")) != nil)
        {
            list = false
        }
//        var error : NSError = nil
        
        //TODO tengo que desserializar aqui
        loaderDelegate?.RequestSuccess(apiMutableData, list: list)
    }
    
    func loadImageFromUrl (imageLocation : String) -> UIImage
    {
        let imageData = NSData(contentsOfURL: NSURL(string : imageLocation)!)
        let image : UIImage = UIImage(data : imageData!)!
        return image
    }
}