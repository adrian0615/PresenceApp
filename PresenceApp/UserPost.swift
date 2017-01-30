//
//  UserPost.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//
import UIKit
import Foundation



//Send *Login, Profile, 


internal enum UserPostResult {
    case successLogin([String: Bool])
    case successUsers([Attendee])
    case successUser(User)

    case failure(UserPost.Error)
}

import Foundation

class UserPost {
    
    enum Error: Swift.Error {
        case http(HTTPURLResponse)
        case system(Swift.Error)
    }
    
    
    func postLogin(email: String, password: String, completion: @escaping (UserPostResult) -> ()) {
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/user-login.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
        
        let payload = try! JSONSerialization.data(withJSONObject: ["email": email, "password": password], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                print(data)
                completion(self.processPostLogin(data: data, error: optionalError))
                
                
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
                
                print("optionalResponse: \(optionalResponse)")
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    func processPostLogin(data: Data, error: Swift.Error?) -> UserPostResult {
        if let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Bool] {
            print(object)
            return .successLogin(object)
        } else {
            return .failure(.system(error!))
        }
    }
    
    func postRegister(firstName: String, lastName: String, company: String, position: String, email: String, password: String, image: UIImage, completion: @escaping (UserPostResult) -> ()) {
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/user-registration.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        
        let payload = try! JSONSerialization.data(withJSONObject: ["firstName": firstName, "lastName": lastName, "company": company, "position": position, "email": email, "password": password, "imageString": imageData?.base64EncodedString()], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                print(data)
                completion(self.processPostRegister(data: data, error: optionalError))
                
                
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
                
                print("optionalResponse: \(optionalResponse)")
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    func processPostRegister(data: Data, error: Swift.Error?) -> UserPostResult {
        if let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Bool] {
            print(object)
            return .successLogin(object)
        } else {
            return .failure(.system(error!))
        }
    }
    
    
    func fetchAttendees(id: Int, completion: @escaping (UserPostResult) -> ()) {
        
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/get-event-attendees.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let payload = try! JSONSerialization.data(withJSONObject: ["id": id], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            
            if let data = optionalData {
                completion(self.processRecentAttendeesRequest(data: data, error: optionalError))
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
    
    func processRecentAttendeesRequest(data: Data, error: Swift.Error?) -> UserPostResult {
        
        if let attendees = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            if let userArray = Attendee.array(from: attendees) {
                return .successUsers(userArray)
            }
        } else {
            return .failure(.system(error!))
        }
        return .failure(.system(error!))
    }
    
    func postCheckIn(email: String, id: Int, completion: @escaping (UserPostResult) -> ()) {
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/user-event-signup.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
        
        let payload = try! JSONSerialization.data(withJSONObject: ["email": email, "eventId": id], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                print(data)
                completion(self.processPostCheckIn(data: data, error: optionalError))
                
                
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
                
                print("optionalResponse: \(optionalResponse)")
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    func processPostCheckIn(data: Data, error: Swift.Error?) -> UserPostResult {
        if let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Bool] {
            print(object)
            return .successLogin(object)
        } else {
            return .failure(.system(error!))
        }
    }
    
    func postProfile(email: String, completion: @escaping (UserPostResult) -> ()) {
        
        let session = URLSession.shared
        let url = URL(string: "https://paul-tiy-presence.herokuapp.com/get-user-info.json")!
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
        
        let payload = try! JSONSerialization.data(withJSONObject: ["email": email], options: [])
        request.httpBody = payload
        
        let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
            
            if let data = optionalData {
                print(data)
                completion(self.processPostProfile(data: data, error: optionalError))
                
                
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
                
                
                print("optionalResponse: \(optionalResponse)")
                
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }
        task.resume()
    }
    
    func processPostProfile(data: Data, error: Swift.Error?) -> UserPostResult {
        if let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] {
            if let user = User.init(jsonObject: object) {
                print(user)
                return .successUser(user)
        } else {
            return .failure(.system(error!))
        }
        } else {
        return .failure(.system(error!))
}
        
}
}
