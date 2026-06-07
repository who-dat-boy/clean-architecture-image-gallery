//
//  CleanImageGalleryApp.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import SwiftUI

@main
struct CleanImageGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            SearchImagesView(
                store: SearchImageStoreImplementation(
                    fetchImagesUseCase: FetchImagesUseCaseImplementation(
                        repository: ImageRepositoryImplementation(
                            dataSource: ImageDataSourceImplementation()
                        )
                    )
                )
            )
        }
    }
}
