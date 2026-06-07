//
//  FetchedImageThumbnailView.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 07.06.2026.
//

import SwiftUI

struct FetchedImageThumbnailView: View {
    let image: SearchListImage
    
    var body: some View {
        AsyncImage(url: image.url) { fetchedImage in
            fetchedImage
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    FetchedImageThumbnailView(
        image: .init(
            id: "some_id",
            url: URL(string: "https://images.unsplash.com/photo-1734629322027-6aa0c50dd51e?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!
        )
    )
}
