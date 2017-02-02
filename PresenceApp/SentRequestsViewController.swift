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
    let requestPost = RequestPost()
    
    var requests: [UserRequest] = []
    var expiredRequests: [UserRequest] = []

    @IBOutlet var currentSentRequestsTableView: UITableView!
    @IBOutlet var expiredSentRequestsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Outgoing"
        
        requestPost.fetchOutgoingRequests(email: userEmail) { result in
            switch result {
            case let .successRequests(array):
                print(result)
                print(array)
                
                self.requests = array
                
            case let .failure(error):
                print("Failed to retrieve requests. Error: \(error)")
                
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
            self.currentSentRequestsTableView.backgroundColor = UIColor.lightGray
            self.currentSentRequestsTableView.reloadData()
            
            self.expiredSentRequestsTableView.backgroundColor = UIColor.lightGray
            self.expiredSentRequestsTableView.reloadData()
            return
        }
    }

}
