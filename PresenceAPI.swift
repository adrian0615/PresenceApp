//
//  AppNetAPI.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


internal struct PresenceAPI {
    internal enum Error: Swift.Error {
        case invalidJSONData
    }
    
    internal static let eventStreamURL: URL = URL(string: "https://paul-tiy-presence.herokuapp.com/get-open-events.json")!
    
}
