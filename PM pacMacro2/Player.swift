//
//  Player.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

open class Player {
    var playerID:   String
    var playerName: String
    var playerType: String
    var status : playerStatus
    var coordinates: CLLocationCoordinate2D
    
    init(playerID: String, playerName: String, playerType: String, latitude: Double, longitude: Double){
        self.playerID   = playerID
        self.playerName = playerName
        self.playerType = playerType
        
        self.coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        self.status = playerStatus.normal
    }
    
    
    open func setCaptured() -> Bool{
        if(status == playerStatus.captured || status == playerStatus.redPellet){
            return false
        }
        else {
            status = playerStatus.captured
            return true
        }
    }
    
    open func isCaptured() -> Bool{
        if(status == playerStatus.captured){
            return true
        }
        return false
    }
    
    open func isRedPelleted() -> Bool{
        if(status == playerStatus.redPellet){
            return true
        }
        return false
    }
    
    public enum playerStatus{
        
        case normal
        case captured
        case redPellet
    }
    
    public enum playerType{
        
        case ghostViewer
        case pacmanViewer
        case ghost
        case pacman
    }
}
