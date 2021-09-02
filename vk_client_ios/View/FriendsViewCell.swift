//
//  FriendsViewCell.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 9/2/21.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var avatarView: AvatarView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func configure(user: User) {
        avatarView.imageView.image = UIImage(named: user.imageName)
        nameLabel.text = user.name
    }
}
