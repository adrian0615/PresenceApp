//
//  Request.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class UserRequest : Equatable {
    //should be a subclass of User
    
    public static func ==(lhs: UserRequest, rhs: UserRequest) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.email == rhs.email
    }
    
    let firstName: String
    let lastName: String
    let email: String
    
    
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        
    }
    
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        
        
        
        guard let userFirst = jsonObject["firstName"] as? String,
            let userLast = jsonObject["lastName"] as? String,
            let userEmail = jsonObject["email"] as? String else {
                
                return nil
        }
        
        
        self.init(firstName: userFirst, lastName: userLast, email: userEmail)
        
    }

}


extension UserRequest {
    internal static func array(from jsonObjects: [[String: Any]]) -> [UserRequest]? {
        let requestArray = jsonObjects.flatMap(UserRequest.init(jsonObject:))
        
        
        return requestArray
    }
}
