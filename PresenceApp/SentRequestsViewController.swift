//
//  SentRequestsViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class SentRequestsViewController: UIViewController {
    
    var userEmail: String = ""

    @IBOutlet var currentSentRequestsTableView: UITableView!
    @IBOutlet var expiredSentRequestsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.update()
    }
    
    func update() {
        OperationQueue.main.addOperation {
            self.currentSentRequestsTableView.backgroundColor = UIColor.lightGray
            self.currentSentRequestsTableView.reloadData()
            
            self.expiredSentRequestsTableView.backgroundColor = UIColor.lightGray
            self.expiredSentRequestsTableView.reloadData()
            return
        }
    }

}
