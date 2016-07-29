//
//  PacMacroInternal.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

public class playerList {
    
    private var currentPlayers : [player] = []
    
    enum playerType{
        
        case viewer
        case ghost
        case pacman
    }
    
    func getPlayers() -> [player] {
        let tempPlayers : [player] = []
        return tempPlayers
    }
    
    func getDots() -> [dot] {
        let dots : [dot] = []
        return dots
    }
    
    
    
    func setCurrentLocation( coordinates : CLLocationCoordinate2D ){
        
    }
    
    
    
}