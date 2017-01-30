//
//  AttendeesTableTableViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class AttendeesTableTableViewController: UITableViewController {
    
    
    let userPost = UserPost()
    var attendees: [Attendee] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        userPost.fetchAttendees(id: 12) { result in
            switch result {
            case let .successUsers(array):
                print(result)
                print(array)
                
                self.attendees = array
                
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attendees.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = "\(attendees[indexPath.row].firstName) \(attendees[indexPath.row].lastName)"
        cell.textLabel?.textAlignment = .center
        
        return cell
    }

    func update() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
            return
        }
    }
    
   

}
