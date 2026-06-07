//
//  SearchImagesResponse.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

struct SearchImagesResponse: Decodable {
    let total: Int
    let totalPages: Int
    let images: [NetworkImageDTO]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case images = "results"
    }
}
