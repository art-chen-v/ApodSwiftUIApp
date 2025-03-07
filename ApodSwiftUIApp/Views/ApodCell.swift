//
//  ApodCell.swift
//  ApodSwiftUIApp
//
//  Created by Artem Chen on 2/14/25.
//

import SwiftUI

struct ApodCell: View {
    let apod: Apod
    
    var body: some View {
        AsyncImage(url: apod.url) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .aspectRatio(1, contentMode: .fill)
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
