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
    var requests: [UserRequest] = []
    var expiredRequests: [UserRequest] = []
    
    let requestPost = RequestPost()
    

    @IBOutlet var currentRequestsTableView: UITableView!
    @IBOutlet var expiredRequestsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Incoming"
        
        
        requestPost.fetchIncomingRequests(email: userEmail) { result in
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
            
            self.currentRequestsTableView.backgroundColor = UIColor.lightGray
            self.currentRequestsTableView.reloadData()
            
            self.expiredRequestsTableView.backgroundColor = UIColor.lightGray
            self.expiredRequestsTableView.reloadData()
            return
            
        }
    }
}
