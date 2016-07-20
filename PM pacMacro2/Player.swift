//
//  Player.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

public class Player{
    var playerID:   String
    var playerName: String
    var playerType: String
    var status : playerStatus
    var coordinates: CLLocationCoordinate2D
    
    init(playerID: String, playerName: String, playerType: String, coordinates: CLLocationCoordinate2D){
        self.playerID   = playerID
        self.playerName = playerName
        self.playerType = playerType
        self.coordinates = coordinates
        self.status = playerStatus.normal
    }
    
    
    func setCaptured() -> Bool{
        if(status == playerStatus.captured || status == playerStatus.redPellet){
            return false
        }
        else {
            status = playerStatus.captured
            return true
        }
    }
    
    func isCaptured() -> Bool{
        if(status == playerStatus.captured){
            return true
        }
        return false
    }
    
    func isRedPelleted() -> Bool{
        if(status == playerStatus.redPellet){
            return true
        }
        return false
    }
    
    enum playerStatus{
        
        case normal
        case captured
        case redPellet
    }
}