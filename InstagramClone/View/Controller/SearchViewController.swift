//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 21.09.2023.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var response: PhotosResponse?
    var selectedPhoto: Photo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        fetch()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // MARK: - CollectionView Layout
        collectionView.collectionViewLayout = createLayout()
        
    }

    // MARK: - SetupSeacrhController

    private func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
        
        
        search.searchBar.becomeFirstResponder()

    }
    // MARK: - Fetch Photos

    func fetch() {
        NetworkManager.fetchRecentPhotos { [weak self] response in
            
            DispatchQueue.main.async {
                if let response = response {
                    self!.response = response
                    self!.collectionView.reloadData()
                } else {
                    print("fetch error")
                }
            }
        }
    }
    
    // MARK: - UISearchResultUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > 2 {
            searchPhotos(with: text)
        }
    }

    
}

