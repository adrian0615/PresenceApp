//
//  EventViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/28/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit


class EventViewController: UIViewController {
    
    var userPost = UserPost()
    var loginAnswer: [String:Bool] = [:]
    var userEmail: String = ""
    
    var event: Event? = nil
    var user: User? = nil
    

    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var endLabel: UILabel!
    
    
    func badLogin(action: UIAlertAction!) {
        print("Will Try Again")
    
    }
    
    
    @IBAction func checkInButton(_ sender: Any) {
        OperationQueue.main.addOperation {
            self.userPost.postCheckIn(email: self.userEmail, id: (self.event?.iD)!) { loginResult in
                switch loginResult {
                    
                case let .successLogin(check) :
                    self.loginAnswer = check
                    
                    if self.loginAnswer == ["success": true] {
                        
                        
                            let attendeesVC = self.storyboard!.instantiateViewController(withIdentifier: "AttendeesView") as! AttendeesTableTableViewController
                        
                        attendeesVC.eventId = (self.event?.iD)!
                            self.present(attendeesVC, animated: true, completion: nil)
                        
                    } else {
                        
                        let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                        
                        acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                    }
                        case let .failure(error) :
                        print("Failed to Login: \(error)")
                        
                        
                            let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                            
                            acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                            
                            self.present(acNoNetwork, animated: true)
                            
                    
                        default :
                        
                            let acNoNetwork = UIAlertController(title: "Error", message: "Failed to Connect", preferredStyle: .alert)
                            
                            acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: self.badLogin))
                            
                            self.present(acNoNetwork, animated: true)
                            
                    
                    
                    }
                        }
            
            
        
        }
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        eventNameLabel?.text = event?.name
        locationLabel?.text = event?.location
        addressLabel?.text = event?.address
        startLabel?.text = "Start: \(Date(timeIntervalSince1970: (event?.startTime)! / 1000))"
        endLabel?.text = "End: \(Date(timeIntervalSince1970: (event?.endTime)! / 1000))"
    

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
        
    }

    
    func update() {
        OperationQueue.main.addOperation {
        
            return
        }
    }

}
