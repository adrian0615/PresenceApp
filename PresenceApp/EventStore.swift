//
//  EventStore.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation





internal enum EventResult {
    case successEventsList([Event])
    case failure(EventStore.Error)
}

internal final class EventStore {
    enum Error: Swift.Error {
        case http(HTTPURLResponse)
        case system(Swift.Error)
        case presenceAPI(PresenceAPI.Error)
        
    }
    
    fileprivate let session: URLSession = {
        return URLSession(configuration: .default)
    }()
    
    internal func fetchEvents(completion: @escaping (EventResult) -> ()) {
        
        let task = session.dataTask(with: PresenceAPI.eventStreamURL) { (optionalData, optionalResponse, optionalError) in
            
            
            if let data = optionalData {
                completion(self.processRecentEventsRequest(data: data, error: optionalError))
                print(data)
              
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
          
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
      
        task.resume()
    }
   
    internal func processRecentEventsRequest(data: Data, error: Swift.Error?) -> EventResult {
        
        if let events = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            if let eventArray = Event.array(from: events) {
                return .successEventsList(eventArray)
            } else {
               
                return .failure(.presenceAPI(.invalidJSONData))
            }
        } else {
         
            return .failure(.system(error!))
        }
    }
}
