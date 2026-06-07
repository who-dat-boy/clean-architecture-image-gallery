//
//  ImageEntityToPresentableMapper.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

struct ImageEntityToPresentableMapper {
    func toSearchListImage(from image: ImageEntity) -> SearchListImage {
        let thumbnailUrl = URL(string: image.urls.thumb)!
        return .init(
            id: image.id,
            url: thumbnailUrl
        )
    }
}
