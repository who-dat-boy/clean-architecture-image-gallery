//
//  ImagesRepository.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

protocol ImagesRepository {
    func searchImages(query: String) async throws -> SearchImagesResult
}
