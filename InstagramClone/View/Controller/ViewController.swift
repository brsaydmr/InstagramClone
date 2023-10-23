//
//  ViewController.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 20.09.2023.
//

import UIKit
class ViewController: UIViewController {
    
    var response: PhotosResponse?
    var selectedPhoto: Photo?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var collectionViewHeightConstraint: NSLayoutConstraint!
    var collectionViewOriginalHeight: CGFloat = 128.0 // İlk başta collection view'in yüksekliği

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        //let screen = UIScreen.main
        //let screenWidth = screen.bounds.size.width
        //let screenHeight = screen.bounds.size.height
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: collectionViewOriginalHeight)
        collectionViewHeightConstraint.isActive = true
    }
    
    // MARK: - Fetch Photos & Reload

    func fetch() {
        NetworkManager.fetchRecentPhotos { [weak self] response in
            
            DispatchQueue.main.async {
                if let response = response {
                    self?.response = response
                    self?.tableView.reloadData()
                    self?.collectionView.reloadData()
                } else {
                    print("fetch error")
                }
            }
        }
    }
}
