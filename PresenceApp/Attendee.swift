//
//  Attendee.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation

class Attendee : Equatable {
    //needs to be a subclass of User
    
    public static func ==(lhs: Attendee, rhs: Attendee) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.company == rhs.company && lhs.position == rhs.position && lhs.email == rhs.email
    }
    
    let firstName: String
    let lastName: String
    let company: String
    let position: String
    let email: String
    
    
    
    init(firstName: String, lastName: String, company: String, position: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.position = position
        self.email = email

        
        
    }
    
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        
        
        
        guard let userFirst = jsonObject["firstName"] as? String,
            let userLast = jsonObject["lastName"] as? String,
            let userCompany = jsonObject["company"] as? String,
            let userPosition = jsonObject["position"] as? String,
            let userEmail = jsonObject["email"] as? String else {
                
                return nil
        }
        
        
        self.init(firstName: userFirst, lastName: userLast, company: userCompany, position: userPosition, email: userEmail)
        
    }
}

//May have to adjust if not getting all items in return
extension Attendee {
    internal static func array(from jsonObjects: [[String: Any]]) -> [Attendee]? {
        let attendeeArray = jsonObjects.flatMap(Attendee.init(jsonObject:))
        
        
        
        return attendeeArray
    }
}
