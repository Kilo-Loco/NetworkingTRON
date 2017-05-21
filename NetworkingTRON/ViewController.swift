//
//  ViewController.swift
//  NetworkingTRON
//
//  Created by Kyle Lee on 5/21/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import TRON

class ViewController: UIViewController {
    
    var users = [User]()

    let tron = TRON(baseURL: "https://jsonplaceholder.typicode.com/")
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func onGetTapped(_ sender: Any) {
        
        let request: APIRequest<UsersResponse, MyError> = tron.request("users")
        request.perform(withSuccess: { (usersResponse) in
            
            self.users = usersResponse.users
            self.tableView.reloadData()
        }) { (error) in
            print(error.response?.statusCode ?? "Status Code Missing")
            guard let err = error.errorModel else { return }
            
            print(err.isEmpty)
        }
        
    }
    
    
    @IBAction func onPostTapped(_ sender: Any) {
        let request: APIRequest<Post, MyError> = tron.request("posts")
        request.method = .post
        request.parameters = ["username": "@kilo_loco", "message": "Be sure to like this video and subscribe"]
        request.perform(withSuccess: { (post) in
            print(post.username)
            print(post.message)
        }) { (error) in
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].companyName
        return cell
    }
    
}







