//
//  Player.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

class Player{
    var playerID:   String
    var playerName: String
    var playerType: String
    var coordinates: CLLocationCoordinate2D
    
    init(playerID: String, playerName: String, playerType: String, coordinates: CLLocationCoordinate2D){
        self.playerID   = playerID
        self.playerName = playerName
        self.playerType = playerType
        self.coordinates = coordinates
    }
}