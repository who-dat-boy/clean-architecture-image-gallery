//
//  ErrorMapper.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 07.06.2026.
//

import Foundation

enum ErrorMapper {
    static func asImageError(_ error: Error) -> ImageError {
        return switch error {
        case let urlError as URLError:
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost: .networkError(.noInternet)
            case .timedOut: .networkError(.requestTimeout)
            default: .unknown(error)
            }
        default: .unknown(error)
        }
    }
}
