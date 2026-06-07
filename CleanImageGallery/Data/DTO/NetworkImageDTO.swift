//
//  NetworkImageDTO.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

struct NetworkImageDTO: Decodable {
    let id: String
    let description: String?
    let urls: ImageUrls
    let createdAt: String
    
    struct ImageUrls: Decodable {
        let thumb: String
        let full: String
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case urls
        case createdAt = "created_at"
    }
}
