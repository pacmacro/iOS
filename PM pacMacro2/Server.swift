//
//  Server.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-08-03.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import Foundation

open class Server : NSObject {
    static let sharedInstance = Server()
    
    fileprivate var serverip : String = "https://pacmacro.herokuapp.com"
    fileprivate var lastConnectionTime : Date = Date()
    private var isConnected : Bool = false
    
    open func connectToServer(overrideServerip:String?){
        if overrideServerip != nil {
            // Connect to speci/Users/Josh/Google_Drive/Academics/Projects/PM pacMacro2/PM pacMacro2/Assets.xcassetsfied override ip
            serverip = overrideServerip!;
            
        }
        else {
            // Attempt to connect to default
        }
    }
    
    open func getAllPlayerDetails() -> [Player] {
        var playerList : [Player] = []
        do{
            
            let requestPlayerDetails : String = "/player/details"
            let data = try Data(contentsOf: URL(string: serverip + requestPlayerDetails)!)
            if let jsonResult = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]{
                for player in jsonResult{
                    let newPlayer = Player()
                    if let name = player["name"] as? String {
                        newPlayer.playerName = name}
                    if let state = player["state"] as? String {
                        newPlayer.status = Player.PlayerStatus(rawValue: state)!}
                    if let location = player["location"] as? [String: Any] {
                        if let lat = location["latitutde"] as? Double,
                            let long = location["longitude"] as? Double {
                        newPlayer.setCoordinates(lat: lat, long: long)
                        }
                    }
                    playerList.append(newPlayer)
                }
            }
        }
        catch let error as NSError {
            print(error)
        }
        
        return playerList
    }
    
    open func getDots() -> [Dot] {
        var dotList : [Dot] = []
        do {
            let requestDotLocations = "/pacdots"
            let data = try? Data(contentsOf: URL(string: serverip + requestDotLocations)!)
            if let jsonResult = try JSONSerialization.jsonObject(with: data!) as? [[String: Any]]{
                for dot in jsonResult{
                    let newDot = Dot()
                    if let location = dot["location"] as? [String: Any],
                    let eaten = dot["eaten"] as? String,
                        let powerdot = dot["powerdot"] as? String {
                        if let lat = location["latitude"] as? Double,
                            let long = location["Longitude"] as? Double{
                            newDot.setCoordinates(lat: lat, long: long)
                            newDot.setPowerDot(isPowerDot: powerdot)
                            newDot.setEaten(isEaten: eaten)
                        }
                    }
                dotList.append(newDot)
                }
            }
        }
        catch let error as NSError {
            print(error)
        }
        
        return dotList
    }
    
    open func putLocation(currentPlayer: Player) {
        // Sends current location to server
        do {
            let player_name = currentPlayer.playerType.rawValue
            let putLocation: String = "/player/\(player_name)/location"
            let json: [String: Any] = ["latitude": "\(currentPlayer.getCoordinates().latitude)",
                "longitude": "\(currentPlayer.getCoordinates().longitude)"
            ]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            // Request code helpfully sourced from https://stackoverflow.com/a/31938246
            let url = URL(string: serverip + putLocation)!
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            // insert json data to the request
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }
            
            task.resume()
        } catch let error as NSError {
            print(error)
        }
    }
    
    open func putStatus(currentPlayer: Player){
        // TODO
        // Updates the status for this player
    }
}

extension String {
    public func toBool() -> Bool {
        if self == "false" {
            return false
        }
        else {
            return true
        }
    }
    
}
