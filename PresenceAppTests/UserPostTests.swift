//
//  UserPostTests.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import PresenceApp
class UserPostTests: XCTestCase {
    
    func testLoginJSONSuccess() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName) else {
            
            fatalError()
        }
        
        let user = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "1234", image: image, eventID: 1, id: 1)
       let jsonRepresentation = try! JSONSerialization.data(withJSONObject: ["email": "adrian@gmail", "password": "1234"], options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let expected = ["email": user.email, "password": user.password]
        
        XCTAssertEqual(jsonObject, expected)
    }
    
    
    func testLoginJSONFailurePassword() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName) else {
            
            fatalError()
        }
        
        let user = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image, eventID: 1, id: 1)
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: ["email": "adrian@gmail", "password": "1234"], options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let expected = ["email": user.email, "password": user.password]
        
        XCTAssertNotEqual(jsonObject, expected)
    }
    
    
    func testLoginJSONSuccess2() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName) else {
            
            fatalError()
        }
        
        let user = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@yahoo", password: "12345", image: image, eventID: 1, id: 1)
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: ["email": "adrian@yahoo", "password": "12345"], options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let expected = ["email": user.email, "password": user.password]
        
        XCTAssertEqual(jsonObject, expected)
    }
    
    func testLoginJSONFailureEmail() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName) else {
            
            fatalError()
        }
        
        let user = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image, eventID: 1, id: 1)
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: ["email": "adrian@yahoo", "password": "4321"], options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let expected = ["email": user.email, "password": user.password]
        
        XCTAssertNotEqual(jsonObject, expected)
    }
    
    func testRegistrationSuccess() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        
        let sample: [String: Any] = ["firstName": "Adrian", "lastName": "McDaniel", "company": "The Iron Yard", "position": "Student", "email": "adrian@gmail", "password": "4321", "imageString": imageData.base64EncodedString(), "checkedInEventId": 1, "id": 1]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let dictionary = User(jsonObject: jsonObject)!
        
        let expected = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image, eventID: 1, id: 1)
        
        XCTAssertEqual(dictionary, expected)
        
    }
    
    func testRegistrationFailureName() {
        
        let _fileName = "Ostrich"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        
        let sample: [String: Any] = ["firstName": "Alec", "lastName": "McDaniel", "company": "The Iron Yard", "position": "Student", "email": "adrian@gmail", "password": "4321", "imageString": imageData.base64EncodedString(), "checkedInEventId": 1, "id": 1]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let dictionary = User(jsonObject: jsonObject)!
        
        let expected = User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image, eventID: 1, id: 1)
        
        XCTAssertNotEqual(dictionary, expected)
        
    }
    
    func testRegistrationSuccess2() {
        
        let _fileName = "IRL-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        
        let sample: [String: Any] = ["firstName": "Tom", "lastName": "Jerry", "company": "MGM", "position": "Pet", "email": "tj@yahoo", "password": "12345", "imageString": imageData.base64EncodedString(), "checkedInEventId": 2, "id": 2]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        
        print(returnedSample)
        
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let dictionary = User(jsonObject: jsonObject)!
        
        let expected = User(firstName: "Tom", lastName: "Jerry", company: "MGM", position: "Pet", email: "tj@yahoo", password: "12345", image: image, eventID: 2, id: 2)
        
        XCTAssertEqual(dictionary, expected)
        
    }
    
    func testRegistrationFailureEventID() {
        
        let _fileName = "IRL-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        
        let sample: [String: Any] = ["firstName": "Tom", "lastName": "Jerry", "company": "MGM", "position": "Pet", "email": "tj@yahoo", "password": "12345", "imageString": imageData.base64EncodedString(), "checkedInEventId": 3, "id": 2]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let dictionary = User(jsonObject: jsonObject)!
        
        let expected = User(firstName: "Tom", lastName: "Jerry", company: "MGM", position: "Pet", email: "tj@yahoo", password: "12345", image: image, eventID: 2, id: 2)
        
        XCTAssertNotEqual(dictionary, expected)
        
    }
    
    func testRegistrationSuccess3() {
        
        let _fileName = "LMAO-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        
        let sample: [String: Any] = ["firstName": "Julio", "lastName": "Jones", "company": "Falcons", "position": "Receiver", "email": "julio@falcons", "password": "Jones11", "imageString": imageData.base64EncodedString(), "checkedInEventId": 11, "id": 3]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let dictionary = User(jsonObject: jsonObject)!
        
        let expected = User(firstName: "Julio", lastName: "Jones", company: "Falcons", position: "Receiver", email: "julio@falcons", password: "Jones11", image: image, eventID: 11, id: 3)
        
        XCTAssertEqual(dictionary, expected)
        
    }
    
    
    func testGetContactsOrGetAttendeesSuccess() {
        
        let _fileName = "LMAO-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let _fileName2 = "IRL-Large"
        
        guard let image2 = UIImage(named: _fileName2), let imageData2 = UIImageJPEGRepresentation(image2, 1.0) else {
            
            fatalError()
        }
        
        let _fileName3 = "Ostrich"
        
        guard let image3 = UIImage(named: _fileName3), let imageData3 = UIImageJPEGRepresentation(image3, 1.0) else {
            
            fatalError()
        }
        
        let userArrayDictionary: [[String: Any]] = [["firstName": "Julio", "lastName": "Jones", "company": "Falcons", "position": "Receiver", "email": "julio@falcons", "password": "Jones11", "imageString": imageData.base64EncodedString(), "checkedInEventId": 1, "id": 3], ["firstName": "Adrian", "lastName": "McDaniel", "company": "The Iron Yard", "position": "Student", "email": "adrian@gmail", "password": "4321", "imageString": imageData2.base64EncodedString(), "checkedInEventId": 1, "id": 1], ["firstName": "Tom", "lastName": "Jerry", "company": "MGM", "position": "Pet", "email": "tj@yahoo", "password": "12345", "imageString": imageData3.base64EncodedString(), "checkedInEventId": 1, "id": 2]]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: userArrayDictionary, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [[String: Any]]
        
        let userArray = User.array(from: jsonObject)!
        
        let expected = [User(firstName: "Julio", lastName: "Jones", company: "Falcons", position: "Receiver", email: "julio@falcons", password: "Jones11", image: image, eventID: 1, id: 3), User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image3, eventID: 1, id: 1), User(firstName: "Tom", lastName: "Jerry", company: "MGM", position: "Pet", email: "tj@yahoo", password: "12345", image: image2, eventID: 1, id: 2)]
        
        XCTAssertEqual(userArray, expected)
    }
    
    func testGetContactsorGetAttendeesFailure() {
        
        let _fileName = "LMAO-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let _fileName2 = "IRL-Large"
        
        guard let image2 = UIImage(named: _fileName2), let imageData2 = UIImageJPEGRepresentation(image2, 1.0) else {
            
            fatalError()
        }
        
        let _fileName3 = "Ostrich"
        
        guard let image3 = UIImage(named: _fileName3), let imageData3 = UIImageJPEGRepresentation(image3, 1.0) else {
            
            fatalError()
        }
        
        let userArrayDictionary: [[String: Any]] = [["firstName": "Julio", "lastName": "Jones", "company": "Falcons", "position": "Receiver", "email": "julio@falcons", "password": "Jones11", "imageString": imageData.base64EncodedString(), "checkedInEventId": 1, "id": 3], ["firstName": "Adrian", "lastName": "McDaniel", "company": "The Iron Yard", "position": "Student", "email": "adrian@gmail", "password": "4321", "imageString": imageData2.base64EncodedString(), "checkedInEventId": 1, "id": 1], ["firstName": "Tom", "lastName": "Jerry", "company": "MGM", "position": "Pet", "email": "tj@yahoo", "password": "12345", "imageString": imageData3.base64EncodedString(), "checkedInEventId": 1, "id": 2]]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: userArrayDictionary, options: [])
        
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [[String: Any]]
        
        let userArray = User.array(from: jsonObject)!
        
        let expected = [User(firstName: "Julio", lastName: "Jones", company: "Falcons", position: "Receiver", email: "julio@falcons", password: "Jones11", image: image, eventID: 1, id: 3), User(firstName: "Tom", lastName: "Jerry", company: "MGM", position: "Pet", email: "tj@yahoo", password: "12345", image: image2, eventID: 1, id: 1), User(firstName: "Adrian", lastName: "McDaniel", company: "The Iron Yard", position: "Student", email: "adrian@gmail", password: "4321", image: image3, eventID: 1, id: 2)]
        
        XCTAssertNotEqual(userArray, expected)
    }
    
    
    
}










