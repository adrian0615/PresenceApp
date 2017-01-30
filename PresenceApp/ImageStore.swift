//
//  ImagePost.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//


//get image back as String
//convert to Data(base64Encoding: "of the image")
//guard let photo = UIImage(data)
//User image property = photo


/*import Foundation


import UIKit

fileprivate var _fileName = "Ostrich"

func createBase64Request() -> URLRequest {
    guard let url = URL(string: " "),
        let image = UIImage(named: _fileName),
        let imageData = UIImageJPEGRepresentation(image, 1.0) else {
            fatalError()
    }
    
    let jsonObject = [
        "fileName" : "Ostrich",
        "fileString" : imageData.base64EncodedString()
    ]
    
    
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    return request
}

func postImageAsString() {
    
    let request = createBase64Request()
    var keepRunning = true
    
    let priorImage = UIImage(named: _fileName)!
    let priorData = UIImageJPEGRepresentation(priorImage, 1.0)
    
    let task = URLSession.shared.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in
        guard let data = optionalData,
            let object = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
                print("optionalResponse: \(String(describing: optionalResponse))")
                print("optionalError: \(String(describing: optionalError))")
                keepRunning = false
                return
        }
        
        guard let fileString = object["fileString"] as? String,
            let decoded = Data(base64Encoded: fileString),
            let image = UIImage(data: decoded) else {
                fatalError()
        }
        
        print("objects: \(object)")
        print("priorData == decoded: \(priorData == decoded)")
        print("priorImage.isEqual(image): \(priorImage.isEqual(image))")
        print(image)
        
        keepRunning = false
    }
    
    task.resume()
    
    while keepRunning {
    }
}*/
