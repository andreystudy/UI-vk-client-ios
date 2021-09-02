//
//  PhotosCollectionViewController.swift
//  vk_client_ios
//
//  Created by Andrey Leganov on 8/29/21.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoUserCell", for: indexPath) as! PhotoCollectionViewCell
        cell.config(user: user!)
        
        return cell
    }

}
