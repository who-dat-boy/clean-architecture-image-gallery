//
//  SearchImagesView.swift
//  CleanImageGallery
//
//  Created by Arthur Danylenko on 05.06.2026.
//

import SwiftUI

struct SearchImagesView<Store: SearchImageStore>: View {
    @ObservedObject var store: Store
    @State private var searchQuery: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                searchBar
                fetchedImagesGrid
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        .overlay(alignment: .bottom, content: errorMessage)
    }
    
    @ViewBuilder
    func errorMessage() -> some View {
        if let errorMessage = store.errorMessage {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(height: 44)
                
                Text(errorMessage)
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
    
    var searchBar: some View {
        HStack {
            TextField("I am looking for...", text: $store.query)
                .textFieldStyle(.roundedBorder)
                .onSubmit(store.fetchImages)
            
            Button("Search", action: store.fetchImages)
                .buttonStyle(.borderedProminent)
                .disabled(store.query.isEmpty)
        }
    }
    
    var fetchedImagesGrid: some View {
        let columns: [GridItem] = Array(
            repeating: GridItem(.flexible(), spacing: 10),
            count: 2
        )
        
        return LazyVGrid(columns: columns, spacing: 10) {
            ForEach(store.images) { FetchedImageThumbnailView(image: $0) }
        }
    }
}

#Preview {
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
