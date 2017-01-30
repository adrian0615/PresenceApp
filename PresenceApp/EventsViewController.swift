//
//  EventsViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/27/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let eventStore = EventStore()
    let userPost = UserPost()
    var events: [Event] = [] {
        didSet {
            update()
        }
    }
    
    var userEmail: String = ""
    
    let eventCellIdentifier = "EventCell"

    
    
    
    
    
    
    @IBOutlet var eventsTableView: UITableView!
    
    @IBAction func contactsButton(_ sender: Any) {
        let contactsVC = self.storyboard!.instantiateViewController(withIdentifier: "ContactsView") as! ContactsViewController
        
        contactsVC.userEmail = self.userEmail
        
        self.present(contactsVC, animated: true, completion: nil)
        
    }
    
    @IBAction func profileButton(_ sender: Any) {
        
        let profileVC = self.storyboard!.instantiateViewController(withIdentifier: "ProfileView") as! ProfileViewController
        
        profileVC.userEmail = self.userEmail
        
        self.present(profileVC, animated: true, completion: nil)
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: eventCellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = events[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.blue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventsTableView.deselectRow(at: indexPath, animated: true)
        
        let eventVC = self.storyboard!.instantiateViewController(withIdentifier: "EventView") as! EventViewController
        
        eventVC.event = events[indexPath.row]
        eventVC.userEmail = userEmail
        
        self.present(eventVC, animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventStore.fetchEvents { result in
            switch result {
            case let .successEventsList(array):
                print(result)
                print(array)
                
                self.events = array
                
                print(self.events[0].name)
                
            case let .failure(error):
                print("Failed to retrieve events. Error: \(error)")
            }
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
        print("email: \(self.userEmail)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        OperationQueue.main.addOperation {
            self.eventsTableView.backgroundColor = UIColor.lightGray
            self.eventsTableView.reloadData()
        return
    }
}

}




