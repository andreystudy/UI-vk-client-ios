//
//  GroupsTableViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/29/21.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    var groups: [Group] = [
        Group(name: "Cars", imageName: "carsImage"),
        Group(name: "Animals", imageName: "animalsImage"),
        Group(name: "Politics", imageName: "politicsImage"),
        Group(name: "Sport", imageName: "sportImage"),
        Group(name: "Tech", imageName: "techImage")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "userGroupCell", for: indexPath)
        cell.imageView?.image = UIImage(named: groups[indexPath.row].imageName)
        cell.textLabel?.text = groups[indexPath.row].name

        return cell
    }

}
