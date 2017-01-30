//
//  Request.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class UserRequest : Equatable {
    public static func ==(lhs: UserRequest, rhs: UserRequest) -> Bool {
        return lhs.id == rhs.id && lhs.status == rhs.status && lhs.originalRequestTime == rhs.originalRequestTime && lhs.stale == rhs.stale
        
    }
    
    let id: Int
    var status: String
    let originalRequestTime: TimeInterval
    var stale: Bool
    
    init(id: Int, status: String, originalRequestTime: TimeInterval, stale: Bool) {
        self.id = id
        self.originalRequestTime = originalRequestTime
        self.status = status
        self.stale = stale
    }
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        guard let requestID = jsonObject["id"] as? Int,
            let requestStatus = jsonObject["status"] as? String,
            let requestTime = jsonObject["originalRequestTime"] as? TimeInterval,
            let requestStale = jsonObject["stale"] as? Bool else {
                
                return nil
        }
        
        self.init(id: requestID, status: requestStatus, originalRequestTime: requestTime, stale: requestStale)
    }
    
}


extension UserRequest {
    internal static func array(from jsonObjects: [[String: Any]]) -> [UserRequest]? {
        let requestArray = jsonObjects.flatMap(UserRequest.init(jsonObject:))
        
        if jsonObjects.count != requestArray.count {
            return nil
        }
        
        return requestArray
    }
}
