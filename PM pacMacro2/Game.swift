//
//  PacMacroInternal.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-19.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit

open class Game {
    
    // TODO Fix this
    // static let sharedInstance = Game(players: [], dots: [], currentPlayer: Void)
    
    public let gameServer = Server() 
    
    public var players : [Player]
    public var dots : [Dot]
    public var currentPlayer: Player?
    public var viewerState: Viewer
    public let pacman : Player
    
    public enum Viewer: String {
        case pacmanViewer = "PacmanViewer"
        case ghostViewer = "GhostViewer"
        case player = "Player"
    }
    
    /// Default constructor, connects to server
    init(){
        self.players = gameServer.getAllPlayerDetails()
        self.dots = gameServer.getDots()
        // TODO fix initialization
        self.currentPlayer = Player(playerID: "", playerName: "", playerType: Player.PlayerType.pacman, latitude: 0, longitude: 0, playerStatus: Player.PlayerStatus.active )
        self.pacman = players.filter({$0.playerType == Player.PlayerType.pacman})[0]
        self.viewerState = Viewer.player
    }
    
    /// Custom constructor which does not request from server
    ///
    /// - Parameters:
    ///   - players: Array of players
    ///   - dots: Array of dots
    ///   - currentPlayer: The selected player
    ///   - viewerState: The type of viewer
    init(players: [Player], dots : [Dot], currentPlayer : Player, viewerState: Viewer){
        self.players = players
        self.dots = dots
        self.currentPlayer = currentPlayer
        self.pacman = players.filter({$0.playerType == Player.PlayerType.pacman})[0]
        self.viewerState = viewerState
    }
    
    open func getVisiblePlayers() -> [Player]{
        switch viewerState {
        case Viewer.pacmanViewer:
            // Viewer can see everyone
            return players
            
        case Viewer.ghostViewer:
            if( pacman.isCaptured() || pacman.isRedPelleted() ){
                // Viewer can see everyone
                return players
            } else {
                // Viewer can see ghosts
                let playersSansPacman = players.filter({$0.playerType != Player.PlayerType.pacman})
                return playersSansPacman
            }
        default:
            let emptyPlayers : [Player] = []
            return emptyPlayers
            // TODO add current location marker
        }
    }
    
    open func getVisibleDots() -> [Dot]{
        return dots.filter({!$0.isCollected()})
    }
    
    /// Fetches update from server and sends current location.
    ///
    /// - Returns: True if operation was successful.
    open func updateServer() -> Bool{
        self.dots = gameServer.getDots()
        self.players = gameServer.getAllPlayerDetails()
        if(self.currentPlayer?.playerType != Player.PlayerType.ghostViewer || self.currentPlayer?.playerType != Player.PlayerType.pacViewer) {
             gameServer.putLocation(currentPlayer: currentPlayer!)
        }
        return true
    }

}
