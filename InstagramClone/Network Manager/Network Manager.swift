//
//  Network Manager.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 8.10.2023.
//

import Foundation
import Alamofire


struct NetworkManager {
    
    static let shared = NetworkManager()
    

    func fetchImage(with url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
    }
    
    static func fetchRecentPhotos(completion: @escaping (PhotosResponse?) -> Void) {
        let url = "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=7dd89640e14551c5df5f7bbae1f68223&format=json&nojsoncallback=1&extras=description,date_taken,owner_name,icon_server,url_n,url_z"
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let ABC = try JSONDecoder().decode(PhotosResponse.self, from: data)
                    completion(ABC)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            case .failure(let error):
                debugPrint(error)
                completion(nil)
            }
        }
    }

}
