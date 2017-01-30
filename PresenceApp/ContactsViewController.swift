//
//  ContactsViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var userEmail: String = ""

    @IBOutlet var contactsViewController: UITableView!
    
    @IBAction func requestsButton(_ sender: Any) {
    }
    @IBAction func sentRequestsButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
