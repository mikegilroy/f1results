//
//  NetworkController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let sharedInstance = NetworkController()
    
    static func searchURL(url: String) -> NSURL {
        let stringURL = url
        return NSURL(string: stringURL)!
    }
    
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if let _ = error {
                completion(data: nil)
                print("error getting dataTask")
                return
            }
            
            if let data = data {
                
                completion(data: data)
                
            } else {
                completion(data: nil)
                print("error getting data")
                return
            }
        }
        dataTask.resume()
    }
    
    
    
    
}