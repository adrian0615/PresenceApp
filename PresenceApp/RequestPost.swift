//
//  RequestPost.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//
import UIKit
import Foundation


internal enum RequestPostResult {
    case success([UserRequest])
    case failure(RequestPost.Error)
}

import Foundation

class RequestPost {
    
    enum Error: Swift.Error {
        case http(HTTPURLResponse)
        case system(Swift.Error)
    }
    
    
    
    
    
    func fetchIncomingRequests(id: Int, status: String, originalRequestTime: TimeInterval, stale: Bool, completion: @escaping (RequestPostResult) -> ()) {
        
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/user-incoming-requests.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let payload = try! JSONSerialization.data(withJSONObject: ["id": id], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            
            if let data = optionalData {
                completion(self.processIncomingRequest(data: data, error: optionalError))
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
    
    func processIncomingRequest(data: Data, error: Swift.Error?) -> RequestPostResult {
        
        if let requests = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            if let requestArray = UserRequest.array(from: requests) {
                return .success(requestArray)
            }
        } else {
            return .failure(.system(error!))
        }
        return .failure(.system(error!))
    }
    
    func fetchOutgoingRequests(id: Int, status: String, originalRequestTime: TimeInterval, stale: Bool, completion: @escaping (RequestPostResult) -> ()) {
        
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/user-incoming-requests.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let payload = try! JSONSerialization.data(withJSONObject: ["id": id], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            
            if let data = optionalData {
                completion(self.processOutgoingRequest(data: data, error: optionalError))
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
    
    func processOutgoingRequest(data: Data, error: Swift.Error?) -> RequestPostResult {
        
        if let requests = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            if let requestArray = UserRequest.array(from: requests) {
                return .success(requestArray)
            }
        } else {
            return .failure(.system(error!))
        }
        return .failure(.system(error!))
    }
}