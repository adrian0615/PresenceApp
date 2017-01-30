//
//  ProfileViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/28/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let userPost = UserPost()
    
    var userEmail: String = ""
    var user: User? = nil
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    
    
    func badConnection(action: UIAlertAction!) {
        print("will try again")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        userPost.postProfile(email: userEmail) { result in
            switch result {
                
            case let .successUser(user):
                self.user = user
                self.update()
            case let .failure(error) :
                print("Failed to Register: \(error)")
                
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badConnection))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                }
            default :
                OperationQueue.main.addOperation {
                    let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badConnection))
                    
                    self.present(acNoNetwork, animated: true)
                    
                    return
                    
                }
            }
        }
    }
    
    
    func update() {
        OperationQueue.main.addOperation {
            self.firstNameLabel.text = "First Name: \(self.user!.firstName)"
            self.lastNameLabel.text = "Last Name: \(self.user!.lastName)"
            self.companyLabel.text = "Company: \(self.user!.company)"
            self.positionLabel.text = "Position: \(self.user!.position)"
            self.emailLabel.text = "Email: \(self.user!.email)"
            
            return
        }
    }
    
    
    
}
