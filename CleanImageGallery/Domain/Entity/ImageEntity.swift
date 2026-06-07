//
//  ImageEntity.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

struct ImageEntity {
    let id: String
    let description: String?
    let urls: ImageUrls
    let createdAt: Date
    
    struct ImageUrls {
        let thumb: String
        let full: String
    }
}
