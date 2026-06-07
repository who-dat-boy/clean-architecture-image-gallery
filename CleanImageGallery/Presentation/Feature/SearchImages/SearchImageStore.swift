//
//  SearchImageStore.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation
import Combine

protocol SearchImageStore: ObservableObject {
    var query: String { get set }
    var images: [SearchListImage] { get set }
    var errorMessage: String? { get }
    
    func fetchImages()
}

@MainActor
final class SearchImageStoreImplementation: SearchImageStore {
    @Published var query: String = ""
    @Published var images: [SearchListImage] = []
    @Published var errorMessage: String?
    
    private let fetchImagesUseCase: FetchImagesUseCase
    private var currentPage: Int = 0
    private var totalPages: Int = 0
    let mapper = ImageEntityToPresentableMapper()
    
    init(fetchImagesUseCase: FetchImagesUseCase) {
        self.fetchImagesUseCase = fetchImagesUseCase
    }
    
    func fetchImages() {
        errorMessage = nil
        
        Task {
            do {
                // Call the usecase and fetch the image
                let searchResult = try await fetchImagesUseCase.fetchImages(query: query)
                totalPages = searchResult.totalPages
                
                // Map the ImageEntity into presentable object
                let searchListImages = searchResult.images.map { mapper.toSearchListImage(from: $0) }
                
                // Update @Published var to update the UI
                self.images = searchListImages
            } catch {
                if let imageError = error as? ImageError {
                    errorMessage = imageError.displayValue
                } else {
                    errorMessage = "Something went wrong."
                }
            }
        }
    }
}
