//
//  User.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

import Foundation


class User : Equatable {
    public static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.company == rhs.company && lhs.position == rhs.position && lhs.email == rhs.email && lhs.id == rhs.id
    }
    //take out password an fix testing
    let firstName: String
    let lastName: String
    let company: String
    let position: String
    var email: String
    let image: UIImage
    let id: Int
    
    init(firstName: String, lastName: String, company: String, position: String, email: String,  image: UIImage, id: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.email = email
        self.image = image
        self.position = position
        self.id = id
        
    }
    
    
    convenience init?(jsonObject: [String: Any]) {
        //May have to adjust if not getting all items in return
        
        let userFirst = jsonObject["firstName"] as? String
            let userLast = jsonObject["lastName"] as? String
            let userCompany = jsonObject["company"] as? String
            let userPosition = jsonObject["position"] as? String
            let userEmail = jsonObject["email"] as? String
            let userImage = jsonObject["imageString"] as? String
            let userID = jsonObject["id"] as? Int
        
        
        var photo = UIImage(named: "blank-profile")
        if userImage != nil {
        let imageData = Data(base64Encoded: userImage!)
        photo = UIImage(data: imageData!)
        }
        
        self.init(firstName: userFirst!, lastName: userLast!, company: userCompany!, position: userPosition!, email: userEmail!, image: photo!, id: userID!)
    }
}

//May have to adjust if not getting all items in return
extension User {
    internal static func array(from jsonObjects: [[String: Any]]) -> [User]? {
        let userArray = jsonObjects.flatMap(User.init(jsonObject:))
        
        
        
        return userArray
    }
}
