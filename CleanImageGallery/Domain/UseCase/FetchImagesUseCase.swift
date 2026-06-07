//
//  FetchImagesUseCase.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

protocol FetchImagesUseCase {
    func fetchImages(query: String) async throws -> SearchImagesResult
}

struct FetchImagesUseCaseImplementation: FetchImagesUseCase {
    private let repository: ImagesRepository
    
    init(repository: ImagesRepository) {
        self.repository = repository
    }
    
    func fetchImages(query: String) async throws -> SearchImagesResult {
        try await repository.searchImages(query: query)
    }
}
