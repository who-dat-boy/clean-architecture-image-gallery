//
//  ImagesDataSource.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import Foundation

protocol ImagesDataSource {
    func searchImages(query: String) async throws -> SearchImagesResponse
}

class ImageDataSourceImplementation {
    let api = "https://api.unsplash.com"
    let accessKey = "Wi8zAyQVfIjeTI0JAL8onC_8Am9PqiHyW-JyQVtVgNM"
}

extension ImageDataSourceImplementation: ImagesDataSource {
    func searchImages(query: String) async throws -> SearchImagesResponse {
        var components = URLComponents(string: api + "/search/photos")!
        components.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        guard let url = components.url else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        print(request.url ?? "")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let searchResponse = try JSONDecoder().decode(SearchImagesResponse.self, from: data)
        return searchResponse
    }
}
