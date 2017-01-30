//
//  ImagePostTests.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/28/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import PresenceApp
class ImagePostTests: XCTestCase {
    
    
    func testImageJSONSuccess() {
        
    let _fileName = "Ostrich"
    
    guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
    
    fatalError()
        }
        
        let jsonImageObject = [
            "fileString" : imageData.base64EncodedString()
        ]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonImageObject, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let imageString = jsonObject["fileString"]
        let newImageData = Data(base64Encoded: imageString!)
       
        
        let expected = ["fileString" : newImageData!.base64EncodedString()]
        
        XCTAssertEqual(jsonImageObject, expected)
        
        }
    
    func testImageJSONFailure() {
        
        let _fileName = "IRL-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let jsonImageObject = [
            "fileString" : imageData.base64EncodedString()
        ]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonImageObject, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let imageString = jsonObject["fileString"]
        _ = Data(base64Encoded: imageString!)
        
        let fileName = "Ostrich"
        
        guard let otherImage = UIImage(named: fileName), let otherImageData = UIImageJPEGRepresentation(otherImage, 1.0) else {
            
            fatalError()
        }
        
        let expected = ["fileString" : otherImageData.base64EncodedString()]
        
        XCTAssertNotEqual(jsonImageObject, expected)
        
    }
    
    
    func testImageJSONSuccess2() {
        
        let _fileName = "IRL-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let jsonImageObject = [
            "fileString" : imageData.base64EncodedString()
        ]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonImageObject, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let imageString = jsonObject["fileString"]
        let newImageData = Data(base64Encoded: imageString!)
        
        
        let expected = ["fileString" : newImageData!.base64EncodedString()]
        
        XCTAssertEqual(jsonImageObject, expected)
        
    }
    
    func testImageJSONFailure2() {
        
        let _fileName = "LMAO-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let jsonImageObject = [
            "fileString" : imageData.base64EncodedString()
        ]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonImageObject, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let imageString = jsonObject["fileString"]
        _ = Data(base64Encoded: imageString!)
        
        let fileName = "Ostrich"
        
        guard let otherImage = UIImage(named: fileName), let otherImageData = UIImageJPEGRepresentation(otherImage, 1.0) else {
            
            fatalError()
        }
        
        let expected = ["fileString" : otherImageData.base64EncodedString()]
        
        XCTAssertNotEqual(jsonImageObject, expected)
        
    }
    
    func testImageJSONSuccess3() {
        
        let _fileName = "LMAO-Large"
        
        guard let image = UIImage(named: _fileName), let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            
            fatalError()
        }
        
        let jsonImageObject = [
            "fileString" : imageData.base64EncodedString()
        ]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonImageObject, options: [])
        let returnedSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: String]
        
        let imageString = jsonObject["fileString"]
        let newImageData = Data(base64Encoded: imageString!)
        
        
        let expected = ["fileString" : newImageData!.base64EncodedString()]
        
        XCTAssertEqual(jsonImageObject, expected)
        
    }
}
