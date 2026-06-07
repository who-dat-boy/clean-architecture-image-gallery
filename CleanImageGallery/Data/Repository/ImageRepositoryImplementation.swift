//
//  ImageRepositoryImplementation.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

class ImageRepositoryImplementation {
    private let dataSource: ImagesDataSource
    
    init(dataSource: ImagesDataSource) {
        self.dataSource = dataSource
    }
}

extension ImageRepositoryImplementation: ImagesRepository {
    func searchImages(query: String) async throws -> SearchImagesResult {
        do {
            let searchResponse = try await dataSource.searchImages(query: query)
            let mapper = NetworkImageToEntityWrapper()
            return .init(
                total: searchResponse.total,
                totalPages: searchResponse.totalPages,
                images: searchResponse.images.map { mapper.entity(from: $0) }
            )
        } catch {
            throw ErrorMapper.asImageError(error)
        }
    }
}
