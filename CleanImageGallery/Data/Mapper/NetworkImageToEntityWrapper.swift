//
//  NetworkImageToEntityWrapper.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

struct NetworkImageToEntityWrapper {
    var formatter = DateFormatter()

    func entity(from dto: NetworkImageDTO) -> ImageEntity {
        .init(
            id: dto.id,
            description: dto.description,
            urls: .init(
                thumb: dto.urls.thumb,
                full: dto.urls.full
            ),
            createdAt: formatter.date(from: dto.createdAt) ?? .now
        )
    }
}
