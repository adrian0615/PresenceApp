//
//  RequestsViewController.swift
//  PresenceApp
//
//  Created by Adrian McDaniel on 1/29/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {
    
    var userEmail: String = ""

    @IBOutlet var currentRequestsTableView: UITableView!
    @IBOutlet var expiredRequestsTableView: UITableView!
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
            self.currentRequestsTableView.backgroundColor = UIColor.lightGray
            self.currentRequestsTableView.reloadData()
            
            self.expiredRequestsTableView.backgroundColor = UIColor.lightGray
            self.expiredRequestsTableView.reloadData()
            return
        }
    }
}
