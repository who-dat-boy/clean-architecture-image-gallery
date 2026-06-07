//
//  ImageError.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 07.06.2026.
//

import Foundation

enum ImageError: Error {
    case resourceNotFound
    case networkError(NetworkError)
    case unknown(Error)
}

enum NetworkError: Error {
    case noInternet
    case requestTimeout
    case internalServerError
}
