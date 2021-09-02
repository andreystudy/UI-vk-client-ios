//
//  FriendsTableViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/29/21.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let users: [User] = [
        User(name: "Andrew", imageName: "andrewImage"),
        User(name: "John", imageName: "johnImage"),
        User(name: "Gwen", imageName: "gwenImage"),
        User(name: "Tom", imageName: "tomImage")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "friendSegue", sender: indexPath)
    }

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! FriendsViewCell
        cell.configure(user: users[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photosVC = segue.destination as? PhotosCollectionViewController else {return}
        let row = (sender as! NSIndexPath).row
        photosVC.user = users[row]
    }

}
