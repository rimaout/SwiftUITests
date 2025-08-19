//
//  RemoteImage.swift
//  Apperizers
//
//  Created by Matteo on 19/08/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        // we are not handling the errors, because a placeholder image is displayed if any error occurs
        
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.sync {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable() 
    }
}

struct AppetizerRemoteImage : View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(from: urlString)}
    }
}
