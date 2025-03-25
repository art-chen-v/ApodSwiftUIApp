//
//  ApodImageProvider.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 3/25/25.
//

import Foundation
import UIKit

class ApodImageProvider: ObservableObject {
    @Published var apodImage: UIImage?
    
    private let imageDownloader = URLSession.shared
    
    private let imageCacheManager = ImageCacheManager.instance
    
    
    func loadImage(from apodUrl: URL?) async throws {
        if let url = apodUrl {
            if let image = imageCacheManager.get(name: url.absoluteString) {
                Task { @MainActor in
                    apodImage = image
                }
            } else {
                let data = try await imageDownloader.httpData(from: url)
                if let image = UIImage(data: data) {
                    imageCacheManager.add(image: image, name: url.absoluteString)
                    Task { @MainActor in
                        apodImage = UIImage(data: data)
                    }
                }
            }
        }
    }
}

