//
//  EventStoreTests.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import PresenceApp

class EventStoreTests: XCTestCase {
    
    
    
    func testEventStoreResultsSuccess() {
        
        
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        
        let sampleEvent: [String: Any?] = ["eventName": "Iron Pints", "location": "MLK", "address": "123 MLK", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "Iron Pints", location: "MLK", address: "123 MLK", /*attendees: [],*/ iD: 1, dateTime: timeInterval)
        
        XCTAssertEqual(dictionary, expected)
    }
    
    
    func testEventStoreResultsFailName() {
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        let sampleEvent: [String: Any?] = ["eventName": "Iron Pints", "location": "MLK", "address": "123 MLK", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "IronMan", location: "MLK", address: "123 MLK", /*attendees: [],*/ iD: 1, dateTime: timeInterval)
        
        XCTAssertNotEqual(dictionary, expected)
    }
    
    func testEventStoreResultsSuccess2() {
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        let sampleEvent: [String: Any?] = ["eventName": "Falcons Game", "location": "Houston", "address": "Superbowl", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "Falcons Game", location: "Houston", address: "Superbowl", /*attendees: [],*/ iD: 1, dateTime: timeInterval)
        
        XCTAssertEqual(dictionary, expected)
    }
    
    func testEventStoreResultsFailLocation() {
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        let sampleEvent: [String: Any?] = ["eventName": "Falcons Game", "location": "Houston", "address": "Superbowl", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "Falcons Game", location: "Housto", address: "Superbowl", /*attendees: [],*/ iD: 1, dateTime: timeInterval)
        
        XCTAssertNotEqual(dictionary, expected)
    }
    
    func testEventStoreResultsFailAddress() {
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        let sampleEvent: [String: Any?] = ["eventName": "Falcons Game", "location": "Houston", "address": "123 Superbowl", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "Falcons Game", location: "Housto", address: "Superbowl", /*attendees: [],*/ iD: 1, dateTime: timeInterval)
        
        XCTAssertNotEqual(dictionary, expected)
    }
    
    func testEventStoreResultsFailID() {
        
        let someDate = Date()
        
        let timeInterval = someDate.timeIntervalSince1970
        
        let sampleEvent: [String: Any?] = ["eventName": "Falcons Game", "location": "Houston", "address": "123 Superbowl", /*attendees: [],*/ "id": 1, "dateTime": timeInterval]
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sampleEvent, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        let dictionary = Event(jsonObject: jsonObject)!
        
        let expected = Event(name: "Falcons Game", location: "Housto", address: "Superbowl", /*attendees: [],*/ iD: 44, dateTime: timeInterval)
        
        XCTAssertNotEqual(dictionary, expected)
    }


}
