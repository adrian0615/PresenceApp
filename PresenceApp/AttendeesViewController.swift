//
//  AttendeesViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 2/1/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class AttendeesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var userPost: UserPost? = nil
    let requestPost = RequestPost()
    var attendees: [Attendee] = []
    
    var userEmail: String = ""
    var requesteeEmail: String = ""
    
    
    var eventId: Int = 0
    
    let attendeeCellIdentifier = "AttendeeCell"
    
    @IBOutlet var attendeesTableView: UITableView!
    
    func sendRequest(action: UIAlertAction!) {
        
        requestPost.postSendRequest(senderEmail: userEmail, sendeeEmail: requesteeEmail) { result in
            switch result {
            case let .successSent(answer):
                if answer == ["success": true] {
                    let acNoNetwork = UIAlertController(title: "Status", message: "Request Sent", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(acNoNetwork, animated: true)
                } else {
                    let acNoNetwork = UIAlertController(title: "Request Failed", message: "You Are Already Friends or You Have Been Blocked", preferredStyle: .alert)
                    
                    acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(acNoNetwork, animated: true)
                }
            case let .failure(error):
                print("Failed to send Request. Error: \(error)")
                
                let acNoNetwork = UIAlertController(title: "Bad Connection", message: "Try Again Later", preferredStyle: .alert)
                
                acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(acNoNetwork, animated: true)
                
            default:
                print("We have some other issue")
                
                let acNoNetwork = UIAlertController(title: "Bad Connection", message: "Try Again Later", preferredStyle: .alert)
                
                acNoNetwork.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(acNoNetwork, animated: true)
                
                
            }
            self.update()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        attendeesTableView.delegate = self
        attendeesTableView.dataSource = self
        
        userPost?.fetchAttendees(id: eventId) { result in
            switch result {
            case let .successUsers(array):
                print(result)
                print(array)
                
                self.attendees = array
                
                print(self.attendees[0].firstName)
                
            case let .failure(error):
                print("Failed to retrieve events. Error: \(error)")
                
            default:
                print("We have some other issue")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attendees.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: attendeeCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(attendees[indexPath.row].firstName) \(attendees[indexPath.row].lastName)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.blue
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        requesteeEmail = attendees[indexPath.row].email
        
        
        let acNoNetwork = UIAlertController(title: "Friend Request", message: "Would You Like to Connect?", preferredStyle: .alert)
        
        acNoNetwork.addAction(UIAlertAction(title: "Yes", style: .default, handler: sendRequest))
        
        acNoNetwork.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(acNoNetwork, animated: true)
        
        return
        
    }
    
    
    
    func update() {
        OperationQueue.main.addOperation {
            self.attendeesTableView.backgroundColor = UIColor.lightGray
            self.attendeesTableView.reloadData()
            return
        }
}
}
