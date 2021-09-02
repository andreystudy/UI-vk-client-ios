//
//  PhotoCollectionViewCell.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/30/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
    func config(user: User) {
        imageView.image = UIImage(named: user.imageName)
    }
}
