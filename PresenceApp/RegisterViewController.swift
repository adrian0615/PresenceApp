//
//  RegisterViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/28/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    let userPost = UserPost()
 
    var registerAnswer: [String:Bool] = [:]
    
    let fileName = "blank-profile"
    
    //let defaultImage = UIImage(named: fileName)
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var companyField: UITextField!
    @IBOutlet var positionField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var imageView: UIImageView!


    
func badRegistry(action: UIAlertAction!) {
 print("Will try again")
 
 }
 
 
 
    @IBAction func registerButton(_ sender: Any) {
      userPost.postRegister(firstName: firstNameField.text!, lastName: lastNameField.text!, company: companyField.text!, position: positionField.text!, email: emailField.text!, password: passwordField.text!, image: imageView.image!) { loginResult in
            switch loginResult {
                
            case let .successLogin(check) :
                self.registerAnswer = check
                
                if self.registerAnswer == ["success": true] {
                    OperationQueue.main.addOperation {
                        
                        let eventsNav = self.storyboard!.instantiateViewController(withIdentifier: "EventsNav")
                        self.present(eventsNav, animated: true, completion: nil)
                        
                        return
                    }
                    
                } else {
                    
                    OperationQueue.main.addOperation {
                        let acLogin = UIAlertController(title: "Error", message: "Missing Entry", preferredStyle: .alert)
                        acLogin.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badRegistry))
                        self.present(acLogin, animated: true)
                        
                        return
                    }
                    
                }
                
            case let .failure(error) :
                print("Failed to Register: \(error)")
                
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badRegistry))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                }
            default :
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badRegistry))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        companyField.delegate = self
        positionField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self

        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == lastNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == companyField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == positionField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == emailField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
