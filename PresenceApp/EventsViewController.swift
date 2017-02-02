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
    var userPost: UserPost? = nil
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
        contactsVC.userPost = self.userPost
        
        self.navigationController?.pushViewController(contactsVC, animated:
            true)
        
    }
    
    @IBAction func profileButton(_ sender: Any) {
        
        let profileVC = self.storyboard!.instantiateViewController(withIdentifier: "ProfileView") as! ProfileViewController
        
        profileVC.userEmail = self.userEmail
        profileVC.userPost = self.userPost
        
        self.navigationController?.pushViewController(profileVC, animated:
            true)
        
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
        eventVC.userPost = userPost
        
        self.navigationController?.pushViewController(eventVC, animated:
            true)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        
        
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventStore.fetchEvents { result in
            switch result {
            case let .successEventsList(array):
                print(result)
                print(array)
                
                self.events = array
                
                
                
            case let .failure(error):
                print("Failed to retrieve events. Error: \(error)")
            }
            
        }
        
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil) }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
    
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




