//
//  CollectionViewDelegateDatasource.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 10.10.2023.
//

import Foundation
import UIKit


extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return response?.photos?.photo?.count ?? 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = response?.photos?.photo?[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchCollectionViewCell
        
        NetworkManager.shared.fetchImage(with: photo?.urlN) { data in
            
            cell.postImages.image = UIImage(data: data)
            //cell.setup(image: UIImage(data: data)!)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = response?.photos?.photo?[indexPath.row]

        performSegue(withIdentifier: "searchToDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toVC = segue.destination as? MainDetailViewController {
            toVC.photo = selectedPhoto
        }
    }
}
