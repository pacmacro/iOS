//
//  PacMacroInternal.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit

class Game {
    
    var players : [Player]
    private var dots : [Dot]
    private var currentPlayerType : playerType
    private var currentPacmanStatus : pacmanStatus
    
    
    init(players: [Player], dots : [Dot], currentPlayerType : playerType){
        self.players = players
        self.dots = dots
        self.currentPlayerType = currentPlayerType
        self.currentPacmanStatus = pacmanStatus.normal
    }
    
    func getVisiblePlayers() -> [Player]{
        switch currentPlayerType {
        case playerType.pacmanViewer:
            // Player can see everyone
            return players
            
        case playerType.ghostViewer:
            if(currentPacmanStatus == pacmanStatus.redPellet || currentPacmanStatus == pacmanStatus.captured){
                // Player can see everyone
                return players
            } else {
                // Player can see ghosts
                let playersSansPacman = players.filter({$0.playerType != "pacman"})
                return playersSansPacman
            }
        default:
            let emptyPlayers : [Player] = []
            return emptyPlayers
        }
    }
    
    func getVisibleDots() -> [Dot]{
        return dots.filter({!$0.isCollected()})
    }
    
    enum playerType{
        
        case ghostViewer
        case pacmanViewer
        case ghost
        case pacman
    }
    
    enum pacmanStatus{
        
        case normal
        case captured
        case redPellet
    }
    
}