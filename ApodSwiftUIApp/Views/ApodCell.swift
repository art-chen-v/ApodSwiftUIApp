//
//  ApodCell.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/14/25.
//

import SwiftUI

struct ApodCell: View {
    let apod: Apod
    var isHeader: Bool = false
    
    @StateObject private var apodImageProvider = ApodImageProvider()
    
    var body: some View {
        VStack {
            Rectangle()
                .overlay {
                    if let apodImage = apodImageProvider.apodImage {
                        Image(uiImage: apodImage)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Color.blue
                    }
                }
                .clipped()
        }
        .aspectRatio(isHeader ? 4/3 : 1, contentMode: .fill)
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        do {
            try await apodImageProvider.loadImage(from: apod.url)
        } catch {
            print("Error loading image: \(error)")
        }
    }
}

struct ApodCell_Previews: PreviewProvider {
    static var apodPreview = Apod(copyright: nil,
                                  date: Date(),
                                  explanation: "test",
                                  hdUrl: nil,
                                  mediaType: nil,
                                  serviceVersion: nil,
                                  title: "Apod",
                                  url: URL(string: "https://apod.nasa.gov/apod/image/2502/IMG_0340-Internet-2_1024.jpg")!)
    static var previews: some View {
        ApodCell(apod: apodPreview)
            .previewLayout(.sizeThatFits)
    }
}
