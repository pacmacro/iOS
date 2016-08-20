//
//  Server.swift
//  PM pacMacro2
//
//  Created by Josh Wu on 2016-08-03.
//  Copyright © 2016 Josh Wu. All rights reserved.
//

import Foundation

class Server : NSObject {
    static let sharedInstance = Server()
    
    private var serverip : String = ""
    private var lastConnectionTime : NSDate = NSDate()

    
    
}