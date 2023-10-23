//
//  Photos.swift
//  InstagramClone
//
//  Created by Barış Aydemir on 8.10.2023.
//

import Foundation

struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]?
}
