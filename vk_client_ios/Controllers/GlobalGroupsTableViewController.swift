//
//  GlobalGroupsTableViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/29/21.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {
    
    var groups: [Group] = [
        Group(name: "Food", imageName: "foodImage"),
        Group(name: "Fashion", imageName: "fashionImage"),
        Group(name: "Celebrity", imageName: "celebrityImage"),
        Group(name: "Comics", imageName: "comicsImage"),
        Group(name: "Cinema", imageName: "cinemaImage")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath)
        cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.height)! / 2
        cell.imageView?.image = UIImage(named: groups[indexPath.row].imageName)
        cell.textLabel?.text = groups[indexPath.row].name

        return cell
    }

}
