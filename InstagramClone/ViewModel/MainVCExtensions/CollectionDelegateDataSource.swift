//
//  CollectionDelegateDataSource.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 9.10.2023.
//

import Foundation
import UIKit

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    

   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return response?.photos?.photo?.count ?? 20
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let photo = response?.photos?.photo?[indexPath.row]

       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollection", for: indexPath) as! MainCollectionViewCell
       
       NetworkManager.shared.fetchImage(with: photo?.buddyIconURL) { data in
           cell.storyImage.image = UIImage(data: data)
       }
       
       cell.storyImage.layer.cornerRadius = 50
       
       cell.userNameLabel.text = photo?.ownername
       return cell
       
   }
}



