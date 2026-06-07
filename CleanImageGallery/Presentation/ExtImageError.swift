//
//  ExtImageError.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 07.06.2026.
//

import Foundation

extension ImageError {
    var displayValue: String {
        return switch self {
        case .resourceNotFound: "Resourse not found"
        case .networkError(let networkError):
            switch networkError {
            case .noInternet: "No internet connection"
            case .requestTimeout: "Your internet connection appears to be slow"
            case .internalServerError: "Something went wrong. Please try again later"
            }
        case .unknown(_): "Something went wrong. Please try again later"
        }
    }
}
