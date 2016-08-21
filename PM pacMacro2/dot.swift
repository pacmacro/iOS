//
//  dot.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-06-26.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import UIKit
import Mapbox

public class Dot {
    private var id : String
    private var coordinates : CLLocationCoordinate2D
    private var isCollectedBool : Bool
    private var isPowerDot : Bool
    
    init(id : String, latitude : Double, longitude : Double, isCollectedBool : Bool, isPowerDot : Bool){
        self.id = id
        self.coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        self.isCollectedBool = isCollectedBool
        self.isPowerDot = isPowerDot
    }
    
    public func getCoordinates() -> CLLocationCoordinate2D{
        return coordinates
    }
    
    public func getId() -> String{
        return id
    }
    
    public func isCollected() -> Bool{
        return isCollectedBool
    }
    
}