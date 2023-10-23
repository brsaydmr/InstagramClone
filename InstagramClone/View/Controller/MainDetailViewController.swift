//
//  MainDetailViewController.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 10.10.2023.
//

import UIKit

class MainDetailViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPpImage: UIImageView!
    @IBOutlet weak var userPostImage: UIImageView!
    @IBOutlet weak var userCommentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPpImage.layer.cornerRadius = 24
        
        if let k = photo {
            userNameLabel.text = k.ownername
            userCommentLabel.text = k.title
            
            
            NetworkManager.shared.fetchImage(with: photo?.buddyIconURL) { data in
                self.userPpImage.image = UIImage(data: data)
            }
            
            NetworkManager.shared.fetchImage(with: photo?.urlN) { data in
                self.userPostImage.image = UIImage(data: data)
            }
        }
    }
}
