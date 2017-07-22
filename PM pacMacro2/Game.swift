//
//  PacMacroInternal.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit

open class Game {
    
    static let sharedInstance = Game(players: [], dots: [], currentPlayerType: Player.playerType.ghost)
    
    open let gameServer = Server() 
    
    fileprivate var players : [Player]
    fileprivate var dots : [Dot]
    fileprivate var currentPlayerType : Player.playerType
    fileprivate let pacman : Player
    
    
    init(players: [Player], dots : [Dot], currentPlayerType : Player.playerType){
        self.players = players
        self.dots = dots
        self.currentPlayerType = currentPlayerType
        pacman = players.filter({$0.playerType == "pacman"})[0]
    }
    
    open func getVisiblePlayers() -> [Player]{
        switch currentPlayerType {
        case Player.playerType.pacmanViewer:
            // Player can see everyone
            return players
            
        case Player.playerType.ghostViewer:
            if( pacman.isCaptured() || pacman.isRedPelleted() ){
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
    
    open func getVisibleDots() -> [Dot]{
        return dots.filter({!$0.isCollected()})
    }
    
    open func updateFromServer(){
        // TODO: Implement
    }

}
