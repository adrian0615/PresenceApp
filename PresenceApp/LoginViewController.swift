//
//  LoginViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/26/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    let userPost = UserPost()
    var loginAnswer: [String:Bool] = [:]
    
    var events: [Event] = []
    
    var userEmail: String = "default"
    
    
    
    
    
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    func badLogin(action: UIAlertAction!) {
        userNameField.text = nil
        passwordField.text = nil
        
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        
        
        
        //self.present(eventsVC, animated: true, completion: nil)
        userPost.postLogin(email: userNameField.text!, password: passwordField.text!) { loginResult in
            switch loginResult {
                
            case let .successLogin(check) :
                self.loginAnswer = check
                
                if self.loginAnswer == ["success": true] {
                    
                    
                    OperationQueue.main.addOperation {
                        
                        
                        
                        let eventsVC = self.storyboard!.instantiateViewController(withIdentifier: "EventsView") as! EventsViewController
                        
                        eventsVC.userEmail = self.userEmail
                        print("email: \(eventsVC.userEmail)")
                        
                       
                        self.present(eventsVC, animated: true, completion: nil)
                        
                        
                        return
                    }
                    
                } else {
                    
                    OperationQueue.main.addOperation {
                        let acLogin = UIAlertController(title: "Error", message: "Invalid Login", preferredStyle: .alert)
                        acLogin.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                        self.present(acLogin, animated: true)
                        
                        return
                    }
                    
                }
                
            case let .failure(error) :
                print("Failed to Login: \(error)")
                
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                }
            default :
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        userNameField.delegate = self
        passwordField.delegate = self
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                userEmail = userNameField.text!
                print(textField.text!)
                return true
            }
        }
        if textField == passwordField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        return true
    }
    
    func update() {
        OperationQueue.main.addOperation {
            return
        }
    }
    
}






