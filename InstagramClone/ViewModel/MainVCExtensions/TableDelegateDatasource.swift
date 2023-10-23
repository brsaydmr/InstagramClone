//
//  TableDelegateDatasource.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 9.10.2023.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.photos?.photo?.count ?? .zero
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = response?.photos?.photo?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTable", for: indexPath) as! MainTableViewCell
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconURL) { data in
            cell.ppImage.image = UIImage(data: data)
            cell.commentPp.image = UIImage(data: data)
        }
        NetworkManager.shared.fetchImage(with: photo?.urlN) { data in
            cell.postImage.image = UIImage(data: data)
        }
        cell.userNameLabel.text = photo?.ownername
        cell.whenTimeLabel.text = "9 saat önce"
        cell.likeLabel.text = "\(photo?.iconserver! ?? "") kişi beğendi"
        cell.commentLabel.text = photo?.title
        cell.locationLabel.text = "Turkey"
        cell.ppImage.layer.cornerRadius = 24
        cell.commentPp.layer.cornerRadius = 24
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPhoto = response?.photos?.photo?[indexPath.row]
        
        performSegue(withIdentifier: "mainToDetail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toVc = segue.destination as? MainDetailViewController {
            toVc.photo = selectedPhoto
        }
    }
}
