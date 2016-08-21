//
//  Server.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-08-03.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import Foundation

public class Server : NSObject {
    static let sharedInstance = Server()
    
    private var serverip : String = "http://pacmacro.herokuapp.com/"
    private var lastConnectionTime : NSDate = NSDate()

    public func getAllPlayerDetails() -> [Player] {
        var playerList : [Player] = []
        do{
            
            let requestPlayerDetails : String = "/player/details"
            
            let data = NSData(contentsOfURL: NSURL(string: serverip + requestPlayerDetails)!)
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            for player in jsonResult as! [Dictionary <String, AnyObject>] {
                playerList.append(
                    Player(playerID: "", playerName: "", playerType: player["name"] as! String,latitude: 0, longitude: 0)
                )
            }
        } catch let error as NSError {
            print(error)
        }
        
        return playerList
    }
    
}