//
//  SearchDecoding.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 23.10.2023.
//

import Foundation

extension SearchViewController {
    
    // MARK: - Search In Photos
    
    func searchPhotos(with text: String) {
        guard let url = URL(string:
                                "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=7dd89640e14551c5df5f7bbae1f68223&text=\(text)&format=json&nojsoncallback=1&extras=description,owner_name,icon_server,url_n,url_z") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            if let data = data, let response = try? JSONDecoder().decode(PhotosResponse.self, from: data) {
                self.response = response
            }
        }.resume()
    }
    

}
