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
    var playerType: Player.PlayerType
    var status : PlayerStatus
    var coordinates: CLLocationCoordinate2D
    
    init(playerID: String, playerName: String, playerType: Player.PlayerType, latitude: Double?, longitude: Double?, playerStatus: PlayerStatus){
        self.playerID   = playerID
        self.playerName = playerName
        self.playerType = playerType
        
        if(latitude != nil && longitude != nil) {
            self.coordinates = CLLocationCoordinate2DMake(latitude!, longitude!)
            self.status = PlayerStatus.ready
        }
        else {
            self.coordinates = CLLocationCoordinate2DMake(0, 0)
            self.status = Player.PlayerStatus.uninitialized
        }

    }
    
    // empty initializer
    init(){
        self.playerID = ""
        self.playerName = ""
        self.playerType = Player.PlayerType.pacman
        self.status = Player.PlayerStatus.ready
        self.coordinates = CLLocationCoordinate2DMake(0, 0)
    }
    
    open func setCaptured() -> Bool{
        if(status == PlayerStatus.captured || status == PlayerStatus.powerup){
            return false
        }
        else {
            status = PlayerStatus.captured
            return true
        }
    }
    
    open func setCoordinates(lat: Double, long: Double){
        self.coordinates = CLLocationCoordinate2DMake(lat, long)
    }
    open func getCoordinates() -> CLLocationCoordinate2D{
        return coordinates
    }
    
    open func isCaptured() -> Bool{
        if(status == PlayerStatus.captured){
            return true
        }
        return false
    }
    
    open func isRedPelleted() -> Bool{
        if(status == PlayerStatus.powerup){
            return true
        }
        return false
    }
    
    public enum PlayerStatus: String{
        
        case ready = "READY"
        case captured = "CAPTURED"
        case uninitialized = "UNINITIALIZED"
        case active = "ACTIVE"
        case powerup = "POWERUP"
    }
    
    public enum PlayerType: String{
        case pacman = "Pacman"
        case blinky = "Blinky"
        case inky = "Inky"
        case pinky = "Pinky"
        case clyde = "Clyde"
        case pacViewer = "PacViewer"
        case ghostViewer = "GhostViewer"
    }
}
