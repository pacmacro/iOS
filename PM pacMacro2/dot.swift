//
//  dot.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-26.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

open class Dot {
    fileprivate var id : String
    fileprivate var coordinates : CLLocationCoordinate2D
    fileprivate var isCollectedBool : Bool
    fileprivate var isPowerDot : Bool
    
    init(id : String, latitude : Double, longitude : Double, isCollectedBool : Bool, isPowerDot : Bool){
        self.id = id
        self.coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        self.isCollectedBool = isCollectedBool
        self.isPowerDot = isPowerDot
    }
    
    init(){
        self.id = ""
        self.coordinates = CLLocationCoordinate2DMake(0, 0)
        self.isCollectedBool = false
        self.isPowerDot = false
    }
    
    open func setCoordinates(lat: Double, long: Double){
        self.coordinates = CLLocationCoordinate2DMake(lat, long)
    }
    open func setEaten(isEaten: String){
        if isEaten == "true"{
            self.isCollectedBool = true
        }
        else {
            self.isCollectedBool = false
        }
        
    }
    open func setPowerDot(isPowerDot: String){
        if isPowerDot == "true" {
            self.isPowerDot = true
        }
        else {
            self.isPowerDot = false
        }
    }
    
    open func getCoordinates() -> CLLocationCoordinate2D{
        return coordinates
    }
    
    open func getId() -> String{
        return id
    }
    
    open func isCollected() -> Bool{
        return isCollectedBool
    }
    
}
