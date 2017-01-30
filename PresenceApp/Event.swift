//
//  Event.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class Event : Equatable {
    public static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.name == rhs.name && lhs.location == rhs.location && lhs.address == rhs.address && lhs.iD == rhs.iD && lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
        
    }
    
    var name: String
    var location: String
    var address: String
    var iD: Int
    var startTime: TimeInterval
    var endTime: TimeInterval
    
    

    
    
    init(name: String, location: String, address: String, iD: Int, startTime: TimeInterval, endTime: TimeInterval) {
        self.name = name
        self.location = location
        self.address = address
        self.iD = iD
        //self.attendees = attendees
        self.startTime = startTime
        self.endTime = endTime
       
    }
    convenience init?(jsonObject: [String: Any]) {
        //May have to adjust if not getting all items in return
        
        guard let eventName = jsonObject["eventName"] as? String,
            let eventLocation = jsonObject["location"] as? String,
            let eventAddress = jsonObject["address"] as? String,
            let eventID = jsonObject["id"] as? Int,
            let eventStart = jsonObject["startTime"] as? TimeInterval,
            let eventEnd = jsonObject["endTime"] as? TimeInterval else {
                
                return nil
                
        }
        
        self.init(name: eventName, location: eventLocation, address: eventAddress, iD: eventID, startTime: eventStart, endTime: eventEnd)
    }
   
    
}

//May have to adjust if not getting all items in return
extension Event {
    internal static func array(from jsonObjects: [[String: Any]]) -> [Event]? {
        let eventArray = jsonObjects.flatMap(Event.init(jsonObject:))
        
        
        return eventArray
    }
}
