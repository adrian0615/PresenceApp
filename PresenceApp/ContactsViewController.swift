//
//  ContactsViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userPost: UserPost? = nil
    var userEmail: String = ""
    
    var contacts: [User] = []


    @IBOutlet var contactsTableView: UITableView!
    
    let contactCellIdentifier = "ContactCell"
    
    @IBAction func requestsButton(_ sender: Any) {
        let requestsVC = self.storyboard!.instantiateViewController(withIdentifier: "RequestsView") as! RequestsViewController
        
        requestsVC.userEmail = self.userEmail
        
        
        
        self.navigationController?.pushViewController(requestsVC, animated:
            true)
        
    }
    @IBAction func sentRequestsButton(_ sender: Any) {
        let sentRequestsVC = self.storyboard!.instantiateViewController(withIdentifier: "SentRequestsView") as! SentRequestsViewController
        
        sentRequestsVC.userEmail = self.userEmail
        
        self.navigationController?.pushViewController(sentRequestsVC, animated:
            true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: contactCellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = "\(contacts[indexPath.row].firstName) \(contacts[indexPath.row].lastName)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.blue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactsTableView.deselectRow(at: indexPath, animated: true)
        
        let contactVC = self.storyboard!.instantiateViewController(withIdentifier: "ContactView") as! ContactViewController
        
        
        contactVC.contact = contacts[indexPath.row]
        
        
        
        
        self.navigationController?.pushViewController(contactVC, animated:
            true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        userPost?.fetchContacts(email: userEmail) { result in
            switch result {
            case let .successContacts(array):
                print(result)
                print(array)
                
                self.contacts = array
                
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
    
    func update() {
        OperationQueue.main.addOperation {
            self.contactsTableView.backgroundColor = UIColor.lightGray
            self.contactsTableView.reloadData()
            return
        }
    }

}
